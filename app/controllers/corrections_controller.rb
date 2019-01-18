class CorrectionsController < ApplicationController
  def new
  end

  def create
    illustration = Illustration.find(params[:illustration_id])
    correction = current_user.corrections.new(correction_params)
    correction.illustration_id = illustration.id
    correction.save
    redirect_to illustration_path(illustration)
  end

  # ストロングパラメーター
  private
  def correction_params
    params.require(:correction).permit(:user_id, :illustration_id, :corrected_illust, :comment)
  end
end
