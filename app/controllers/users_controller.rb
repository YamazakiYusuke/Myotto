class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authority_user_edit_destroy, only: [:edit, :update]

  def index
    if params[:which] == 'following'
      @users = User.find(params[:user_id]).following
      @which = 'following'
    else params[:which] == 'followers'
      @users = User.find(params[:user_id]).followers
      @which = 'followers'
    end
  end

  def show
    @translations = Translation.where(user_id: params[:id]).includes(sentence: :book).includes(:user_translation_favorites).page(params[:page]).per(10)
  end

  def new
    @user = User.new
    2.times { @user.user_locale_statuses.build } if @user.user_locale_statuses.size == 0
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to translations_path, notice: t('.created_account')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: t('.edited_account')
    else
      render :edit
      binding.pry
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
    unless @user.id == current_user.id
      flash[:notice] = t('reject_edit')
      redirect_to user_path(@user.id)
    end
  end
end
