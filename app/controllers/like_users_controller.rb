class LikeUsersController < ApplicationController
  def create
    user = User.find(params[:user_id])
    like_user = LikeUser.new(user_id: user.id)
    like_user.my_user_id = current_user.id
    like_user.save
    redirect_to user_path(user)
  end

  def destroy
    user = User.find(params[:user_id])
    like_user = LikeUser.find_by(user_id: user.id, my_user_id: current_user.id)
    like_user.destroy
    redirect_to user_path(user)
  end
end
