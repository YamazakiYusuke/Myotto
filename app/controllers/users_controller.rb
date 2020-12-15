class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  # before_action :set_locale, only: [:show]

  def show
    @translations = Translation.where(user_id: params[:id]).includes(sentence: :book)
  end

  def new
    @user = User.new
    2.times { @user.user_locale_statuses.build }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to translations_path, notice: 'アカウントを作成しました！'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to translations_path, notice: 'アカウントを編集しました'
    else
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(current_user.id)
  end

  def set_locale
    @locales = Locale.all
  end

  def user_params
    params.require(:user).permit(:name, :profile, :icon, :email, :password, :password_confirmation,
                                  user_locale_statuses_attributes: [:locale_id, :is_native, :is_wanted, :wanted_level] )
  end

end
