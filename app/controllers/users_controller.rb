class UsersController < ApplicationController
  def top
    illustrations = Illustration.where.not(illust_image_id: nil)
    @illustrations = illustrations.limit(5)
  end

  def mypage
    @user = User.find(params[:id])
    @illustrations = @user.illustrations
    @like_users = LikeUser.where(my_user_id: current_user.id)
    @like_illustrations = @user.like_illustrations
    @corrections = @user.corrections.where.not(corrected_illust_id: nil)
    @comments = @user.corrections.where(corrected_illust_id: nil)
  end

  def index
    @users = User.all.search(params[:search])
  end

  def show
    @user = User.find(params[:id])
    @illustrations = @user.illustrations
    @corrections = @user.corrections.where.not(corrected_illust_id: nil)
    @comments = @user.corrections.where(corrected_illust_id: nil)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to users_mypage_path(params[:id])
  end

  def destroy
    user = current_user
    user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :history_year, :history_month, :introduction_text, :user_image)
  end
end
