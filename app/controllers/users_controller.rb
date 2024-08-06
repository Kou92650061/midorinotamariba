class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
    @post_images = @post_images.includes(:post_tags).where('post_tags.tag_id': params[:tag_id]) if params[:tag_id].present?
    @tags = Tag.all
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集に成功しました。"
      redirect_to user_path(current_user)
    else
      flash.now[:notice] = "編集に失敗しました。"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
