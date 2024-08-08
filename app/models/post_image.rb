class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :nices, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  
  def self.search_for(content, method)
    if method == 'perfect'
      PostImage.where(title: content)
    elsif method == 'forward'
      PostImage.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      PostImage.where('name LIKE ?', '%' + content)
    else
      PostImage.where('name LIKE ?', '%' + content + '%')
    end
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def niced_by?(user)
    nices.exists?(user_id: user.id)
  end
end
