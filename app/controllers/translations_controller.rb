class TranslationsController < ApplicationController
  before_action :authenticate_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_translation, only: [:edit, :update, :destroy]
  before_action :authority_user_edit_destroy, only: [:edit, :update, :destroy]

  def index  #N + 1問題 
    if params[:translation].present?
      if params[:translation][:search_translation].present?
        @translations = Translation.translation_scope(params[:translation][:search_translation]).includes(:user, :sentence, :user_translation_favorites, :user_translation_comments)
                                                                          .order(created_at: :desc).page(params[:page]).per(20)
      end
    else
      user_native_id = current_user.user_locale_statuses.find_by(is_native: true).locale_id
      user_wanted_id = current_user.user_locale_statuses.find_by(is_wanted: true).locale_id  ## <=これも稼働させる

      user_locales =  UserLocaleStatus.where(is_wanted: true).where(locale_id: user_native_id).includes(user: :translations)
      users = user_locales.map { |n| n.user }
      translations = users.flat_map { |n| n.translations }
      translations_sorted = translations.sort_by!{|t|t[:id]}.reverse
      @translations = Kaminari.paginate_array(translations_sorted).page(params[:page]).per(20)
    end
  end

  def show
    @translation = Translation.includes(:user, :sentence).find(params[:id])
    @comments = UserTranslationComment.where(translation_id: @translation.id).includes(:user).order(created_at: :desc)
    @comment = @translation.user_translation_comments.build
    @favorite = current_user.user_translation_favorites.find_by(translation_id: @translation.id)
  end

  def new
    @translation = Translation.new
    @translation[:sentence_id] = params[:sentence_id]
  end

  def create
    @translation = current_user.translations.new(translation_params)
    respond_to do |format|
      if @translation.save
        format.html { redirect_to translation_path(@translation.id), notice: t('.new_posted') }
        format.js { render :index }
      else
        format.html { render :new }
        format.js { render :index }
      end
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
    params.require(:translation).permit(:content, :sentence_id )
  end

  def authority_user_edit_destroy
    unless @translation.user.id == current_user.id
      flash[:notice] = t('reject_edit')
      redirect_to translations_path
    end
  end
end
