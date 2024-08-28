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
    sanitized_content = ActiveRecord::Base.sanitize_sql_like(content)
    sql = case method
      when "perfect"
        sanitized_content
      when "forward"
        "#{sanitized_content}%"
      when "backward"
        "%#{sanitized_content}"
      else
        "%#{sanitized_content}%"
      end
    
    where("title LIKE ?", sql)
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
