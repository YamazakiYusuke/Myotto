class UsersController < ApplicationController
  before_action :set_user, only: [:new, :show, :edit, :update]
  before_action :set_locale, only: [:show, :new, :edit]

  def show
    @translations = Translation.where(user_id: params[:id]).includes(sentence: :book)
  end

  def edit #editするたびにどんどん増えていく
    2.times { @user.user_locale_statuses.build } if @user.user_locale_statuses.size == 0
  end

  def update #<= エラー
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
    params.require(:user).permit(:name, :profile, :icon, :email, user_locale_statuses_attributes: [:locale_id, :is_native, :is_wanted, :wanted_level] )
  end

end
