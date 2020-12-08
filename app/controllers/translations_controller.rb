class TranslationsController < ApplicationController
  before_action :set_translation, only: [:show, :edit, :update, :destroy]

  def index
    # 検索機能追加
    @translations = Translation.all.includes(:sentence)

  end

  def show ## <= 12/9 8.10ここから
    # show/viewにコメント機能、like機能追加
  end

  def new
    @translation = Translation.new
  end

  def create
    @translation = current_user.translations.new(translation_params)
    @translation[]
    if params[:back]
      render :new
    else
      if @translation.save
        redirect_to translations_path
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @translation.update(translation_params)
      redirect_to translations_path, notice: '翻訳を編集しました'
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
    params.require(:translation).permit(:content)
  end
end
