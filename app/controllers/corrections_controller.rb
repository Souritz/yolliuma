class CorrectionsController < ApplicationController
  def new
  end

  def create
    @correction = Correction.new(correction_params)
    @correction.save
  end

  # ストロングパラメーター
  private
  def correction_params
    params.require(:correction).permit(:corrected_illust, :comment)
  end
end
