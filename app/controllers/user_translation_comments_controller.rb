class UserTranslationCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  private
  def user_translation_comment_params
    params.require(:user_translation_comment).permit(:content)
  end
end