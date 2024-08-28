class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = current_user.post_images.new(post_image_params)
    if @post_image.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to post_image_path(@post_image.id)
    else
      flash.now[:notice] = "投稿に失敗しました。"
      render :new
    end
  end

  def index
    @post_images = PostImage.page(params[:page])
    @post_images = @post_images.includes(:post_tags).where('post_tags.tag_id': params[:tag_id]) if params[:tag_id].present?

    #@post_images = params[:tag_id].present? ? Tag.find(params[:tag_id]).post_images : PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:image, :title, :body, tag_ids: [])
  end
end
