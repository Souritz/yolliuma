class CorrectionsController < ApplicationController
  def new
  end

  def create
    illustration = Illustration.find(params[:id])
    correction = current_user.corrections.new(correction_params)
    correction.illustration_id = illustration.id
    correction.user_id = illustration.user.id
    correction.save
    redirect_to illustrations_path(illustration)
  end

  # ストロングパラメーター
  private
  def correction_params
    params.require(:correction).permit(:user_id, :illustration_id, :corrected_illust, :comment)
  end
end
