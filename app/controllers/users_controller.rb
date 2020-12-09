class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @translations = @user.translations.includes(sentence: :book)
  end
end