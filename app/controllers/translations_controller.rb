class TranslationsController < ApplicationController
  before_action :authenticate_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_translation, only: [:edit, :update, :destroy]
  before_action :authority_user_edit_destroy, only: [:edit, :update, :destroy]

  def index  #要リファクタ 検索機能追加
    @translations = Translation.all.includes(sentence: :book).includes(:user).includes(:user_translation_favorites).includes(:user_translation_comments).order(id: :desc).page(params[:page]).per(20)
    # user_locales =  UserLocaleStatus.where(is_wanted: true).where(locale_id: current_user.user_locale_statuses.find_by(is_native: true).locale_id).includes(user: :translations)
    # users = user_locales.map { |n| n.user }
    # @translations = users.map { |n| n.translations }
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
    if @translation.save
      redirect_to translation_path(@translation.id), notice: t('.new_posted')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @translation.update(translation_params)
      redirect_to translation_path(@translation.id), notice: t('.edited_post')
    else
      render :edit
    end
  end

  def destroy
    @translation.destroy
    redirect_to translations_path, notice: t('.destoryed_post')
  end

  private
  def set_translation
    @translation = Translation.find(params[:id])
  end

  def translation_params
    params.require(:translation).permit(:content, :sentence_id)
  end

  def authority_user_edit_destroy
    unless @translation.user.id == current_user.id
      flash[:notice] = t('reject_edit')
      redirect_to translations_path
    end
  end
end
