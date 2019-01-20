class LikeUsersController < ApplicationController
  def create
    user = User.find(params[:user_id])
    like_user = current_user.like_users.new(user_id: user.id)
    like_user.save
    binding.pry
    redirect_to user_path(user)
  end

  def destroy
    user = User.find(params[:user_id])
    like_user = current_user.like_users.find_by(user_id: user.id)
    like_user.destroy
    redirect_to user_path(user)
  end
end
