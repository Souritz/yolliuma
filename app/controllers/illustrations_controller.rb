class IllustrationsController < ApplicationController
  def new
    @illustration = Illustration.new
  end

  def create
    @illustration = Illustration.new(illustration_params)
    @illustration.save
    redirect_to illustration_path(illustration.id)
  end

  def show
    @illustration = Illustration.find(params[:id])
    @correction = Correction.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end

  private
  def illustration_params
    params.require(:illustration).permit(:llust_image, :illust_title, :illust_introduction, :evaluation_point)
  end
end
