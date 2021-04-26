class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authority_user_edit_destroy, only: [:edit, :update]

  def index
    @followings = User.find(params[:user_id]).following.includes(user_locale_statuses: :locale)
    @followers = User.find(params[:user_id]).followers.includes(user_locale_statuses: :locale)
  end

  def show
    @translations = Translation.where(user_id: params[:id]).includes(sentence: :book).includes([:user_translation_favorites,:user_translation_comments]).order(id: :desc).page(params[:page]).per(10)
  end

  def new
    @user = User.new
    @user.user_locale_statuses.build
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to translations_path, notice: "You success to create new account! Wellcome!!"
    else
      @user = User.new
      @user.user_locale_statuses.build
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You edited a account "
    else
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_locale
    @locales = Locale.all
  end

  def user_params
    params.require(:user).permit(:name, :profile, :icon, :icon_cache, :email, :password, :password_confirmation,
                                  user_locale_statuses_attributes: [:locale_id, :is_native, :is_wanted, :wanted_level] )
  end

  def authority_user_edit_destroy
    unless @user.id == current_user.id || current_user.admin == true
      flash[:notice] = t('reject_edit')
      redirect_to user_path(@user.id)
    end
  end
end
