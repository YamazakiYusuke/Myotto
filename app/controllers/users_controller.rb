class UsersController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update]
  before_action :set_locale, only: [:show, :new, :edit]

  def show
    @translations = Translation.where(user_id: params[:id]).includes(sentence: :book)
    @native = UserLocaleStatuse.where(is_native:true).where(id: current_user)[0]
    @wanted = UserLocaleStatuse.where(is_wanted:true).where(id: current_user)[0]
    binding.pry
  end

  def new
  end

  def create

  end

  def edit
    @user.user_locale_statuses
  end

  def update #<= クソみたいなコード 要リファクタ save時のif分岐 このコードはnewアクションに移動
    if @user.update(user_params)
      UserTranslationComment.make_native()
      @user_native_locale_statuse = UserLocaleStatuse.new
      @user_native_locale_statuse[:user_id] = current_user.id
      @user_native_locale_statuse[:locale_id] = params[:user][:native]
      @user_native_locale_statuse[:is_native] = true
      @user_native_locale_statuse.save

      @user_wanted_locale_statuse = UserLocaleStatuse.new
      @user_wanted_locale_statuse[:user_id] = current_user.id
      @user_wanted_locale_statuse[:locale_id] = params[:user][:wanted]
      @user_wanted_locale_statuse[:is_wanted] = true
      @user_wanted_locale_statuse[:wanted_level] = params[:user][:wanted_level]
      @user_native_locale_statuse.save

      redirect_to translations_path, notice: 'アカウントを編集しました'
    else
      render :edit
    end
  end

  private
  def set_task
    @user = User.find(current_user.id)
  end

  def set_locale
    @locales = Locale.all
  end

  def user_params
    params.require(:user).permit(:account_update, keys: [ :name, :profile, :icon, :icon_cache, :email ])
  end

  def user_native_locale_statuse_params
    params.require(:user).permit(:account_update, keys: [ :native ])
  end

  def user_wanted_locale_statuse_params
    params.require(:user).permit(:account_update, keys: [ :wanted, :wanted_level ])
  end  
end
