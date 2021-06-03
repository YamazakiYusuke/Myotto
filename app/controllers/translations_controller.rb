class TranslationsController < ApplicationController
  before_action :authenticate_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_translation, only: [:edit, :update, :destroy]
  before_action :authority_user_edit_destroy, only: [:edit, :update, :destroy]

  def index
    if params[:translation].present?
      if params[:translation][:search_translation].present?
        @translations = Translation.translation_scope(params[:translation][:search_translation]).includes([:user, :sentence, :user_translation_favorites, :user_translation_comments]).order(id: :desc).page(params[:page]).per(20)
      end
    else
      user_native_locale = current_user.user_locale_statuses.find_by(is_native: true).locale.name
      user_wanted_locale = current_user.user_locale_statuses.find_by(is_wanted: true).locale.name
      @translations = Translation.where(book_locale: user_native_locale, user_locale: user_wanted_locale).or(Translation.where(book_locale: user_wanted_locale, user_locale: user_native_locale)).includes([:user, :sentence, :user_translation_favorites, :user_translation_comments]).order(id: :desc).page(params[:page]).per(20)
    end
  end

  def show
    @translation = Translation.includes(:user, :sentence).find(params[:id])
    @comments = UserTranslationComment.where(translation_id: @translation.id).includes(:user).order(id: :desc)
    @comment = @translation.user_translation_comments.build
    @favorite = current_user.user_translation_favorites.find_by(translation_id: @translation.id)
  end

  def new
    @sentence = Sentence.find(params[:sentence_id])
    @translation = @sentence.translations.build
    respond_to do |format|
      format.js
    end
  end

  def create
    @sentence = Sentence.find(params[:translation][:sentence_id])
    book =  @sentence.book
    @sentences =  book.sentences.includes(:book).order(id: "ASC").page(params[:page]).per(40)
    @translation = current_user.translations.new(translation_params)
    @translation[:book_locale] = book.book_locale_statuses[0].locale.name
    @translation[:user_locale] = choice_user_locale(book)
    respond_to do |format|
      if @translation.save(translation_params)
        # flash.now[:alert] = 'You posted a new trancelation.'
        format.js { render :create }
        format.html { redirect_to book_path(book.id)}
      else
        # flash.now[:alert] = 'Failed to post a trancelation'
        format.js { render :create_error }
      end
    end
  end

  def edit
  end

  def update
    if @translation.update(translation_params)
      redirect_to translation_path(@translation.id), notice: "You edited a new trancelation"
    else
      render :edit
    end
  end

  def destroy
    @translation.destroy
    redirect_to translations_path, alert: "You destoryed a trancelation"
  end

  private
  def set_translation
    @translation = Translation.find(params[:id])
  end

  def translation_params
    params.require(:translation).permit(:content, :sentence_id )
  end

  def authority_user_edit_destroy
    unless @translation.user.id == current_user.id || current_user.admin == true
      flash[:alert] = "You can't edit this post"
      redirect_to translations_path
    end
  end

  def choice_user_locale(book)
    if book.book_locale_statuses[0][:locale_id] == current_user.user_locale_statuses.find_by(is_wanted: true)[:locale_id]
      current_user.user_locale_statuses.find_by(is_native: true).locale.name
    else
      current_user.user_locale_statuses.find_by(is_wanted: true).locale.name
    end
  end
end
