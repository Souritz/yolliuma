class LikeIllustrationsController < ApplicationController
  def create
    illustration = Illustration.find(params[:illustration_id])
    like_illustration = current_user.like_illustrations.new(illustration_id: illustration.id)
    like_illustration.save
    render json: illustration.id
    # redirect_to illustration_path(illustration)
  end

  def destroy
    illustration = Illustration.find(params[:illustration_id])
    like_illustration = current_user.like_illustrations.find_by(illustration_id: illustration.id)
    like_illustration.destroy
    render json: illustration.id
    # redirect_to illustration_path(illustration)
  end
end
