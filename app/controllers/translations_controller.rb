class TranslationsController < ApplicationController
  before_action :set_translation, only: [:edit, :update, :destroy]

  def index    
    @search = Translation.ransack(params[:q])
    @translations = @search.result.includes(:sentence, :user).order(created_at: :desc)
  end

  def show
    @translation = Translation.includes(:user, :sentence).find(params[:id])
    @comments = UserTranslationComment.where(translation_id: @translation.id).includes(:user).order(created_at: :desc)
    @favorite = current_user.user_translation_favorites.find_by(translation_id: @translation.id)
  end

  def new
    @translation = Translation.new
    @translation[:sentence_id] = params[:sentence_id]
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
