class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def index
    @post_images = PostImage.all
  end

  def show
  end
end
