class UsersController < ApplicationController
  def top
    illustrations = Illustration.where.not(illust_image_id: nil)
    @illustrations = illustrations.limit(5)
  end

  def mypage
    @user = User.find(params[:id])
    @illustrations = @user.illustrations
  end

  def index
    @users = User.all.search(params[:search])
  end

  def show
    @user = User.find(params[:id])
    @illustrations = @user.illustrations
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
