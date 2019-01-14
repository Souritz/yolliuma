class UsersController < ApplicationController
  def top
  end

  def mypage
  end

  def index
  end

  def show
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
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :history_year, :history_month, :introduction_text, :user_image)
  end
end
