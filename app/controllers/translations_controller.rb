class TranslationsController < ApplicationController
  before_action :set_translation, only: [:edit, :update, :destroy]

  def index
    # 検索機能追加
    users = User.where(native: current_user.language1).where(language1: current_user.native)
    @translations = users.map { |n| n.translations }
    binding.pry

    @translations = Translation.all.includes(:sentence, :user).limit(100).order(created_at: :desc)

  end

  def show
    # show/viewにコメント機能、like機能追加
    @translation = Translation.includes(:user, :sentence).find(params[:id])
  end

  def new
    @translation = Translation.new
    @translation[:sentence_id] = params[:id].to_i
  end

  def create
    @translation = current_user.translations.new(translation_params)
    if params[:back]
      render :new
    else
      if @translation.save
        redirect_to translation_path(@translation.id), notice: '翻訳を作成しました'
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @translation.update(translation_params)
      redirect_to translation_path(@translation.id), notice: '翻訳を編集しました'
    else
      render :edit
    end
  end

  def destroy
    @translation.destroy
    redirect_to translations_path, notice: '翻訳を削除しました'
  end

  private
  def set_translation
    @translation = Translation.find(params[:id])
  end

  def translation_params
    params.require(:translation).permit(:content, :sentence_id)
  end
end
