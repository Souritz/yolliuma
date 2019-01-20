class CorrectionsController < ApplicationController
  def create
    illustration = Illustration.find(params[:illustration_id])
    correction = current_user.corrections.new(correction_params)
    correction.illustration_id = illustration.id
    correction.save
    redirect_to illustration_path(illustration)
  end

  def destroy
    correction = Correction.find(params[:id])
    correction.destroy
    redirect_to illustration_path(params[:illustration_id])
  end

  def show
  end

  # ストロングパラメーター
  private
  def correction_params
    params.require(:correction).permit(:user_id, :illustration_id, :corrected_illust, :comment)
  end
end
