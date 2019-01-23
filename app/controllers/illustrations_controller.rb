class IllustrationsController < ApplicationController
  def new
    @illustration = Illustration.new
    @tag_list = TagList.new
  end

  def create
    illustration = Illustration.new(illustration_params)
    illustration.user_id = current_user.id
    illustration.save
    tag_list = illustration.tag_lists.new(tag_list_params)
    tag_lists = tag_list.tag_name.split(",") # 受け取ったタグをカンマで分割
    tag_lists.each do |tag|
      tag_list = TagList.new
      tag_list.illustration_id = illustration.id
      tag_list.tag_name = tag
      tag_list.save
    end
    redirect_to illustration_path(illustration)
  end

  def show
    @illustration = Illustration.find(params[:id])
    @user = @illustration.user
    @correction = Correction.new
    @corrections = @illustration.corrections
    @tag_list = TagList.new
    @correct = 0 # 添削毎につける連番の初期値
    @comment = 0 # コメント毎につける連番の初期値
  end

  def edit
    @illustration = Illustration.find(params[:id])
  end

  def update
  end

  def destroy
    illustration = Illustration.find(params[:id])
    illustration.destroy
    redirect_to illustrations_path
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
