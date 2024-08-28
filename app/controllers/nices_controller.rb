class NicesController < ApplicationController
  def create
    post_image = PostImage.find(params[:post_image_id])
    current_user.nices.create(post_image_id: post_image.id)
    redirect_to post_image_path(post_image)
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    nice = current_user.nices.find_by(post_image_id: post_image.id)
    nice.destroy
    redirect_to post_image_path(post_image)
  end
end
