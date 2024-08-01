class UsersController < ApplicationController
  def show
    @user = params[:tag_id].present? ? Tag.find(params[:tag_id]).post_images : User.find(params[:id])
    @post_images = @user.post_images
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
