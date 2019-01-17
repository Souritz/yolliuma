class IllustrationsController < ApplicationController
  def new
    @illustration = Illustration.new
    @tag_list = TagList.new
  end

  def create
    @illustration = Illustration.new(illustration_params)
    @illustration.user_id = current_user.id
    @illustration.save
    @tag_list = TagList.new(tag_list_params)
    @tag_list.save
    redirect_to illustration_path(@illustration.id)
  end

  def show
    @illustration = Illustration.find(params[:id])
    @user = @illustration.user
    @correction = Correction.new
    @corrections = @illustration.corrections
  end

  def edit
    @illustration = Illustration.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def index
    @illustrations = Illustration.all.search(params[:search])
  end

  # ストロングパラメーター
  private
  def illustration_params
    params.require(:illustration).permit(:illust_image, :illust_title, :illust_introduction, :evaluation_point)
  end

  def tag_list_params
    params.require(:tag_list).permit(:tag_name)
  end
end
