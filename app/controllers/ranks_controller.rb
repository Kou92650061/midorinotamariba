class RanksController < ApplicationController
  def index
    @post_images = PostImage.left_joins(:nices).group(:id).order("count(nices.post_image_id) desc")
    @post_images = @post_images.includes(:post_tags).where('post_tags.tag_id': params[:tag_id]) if params[:tag_id].present?
  end
end
