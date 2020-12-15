class UserTranslationCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @comment = current_user.user_translation_comments.new(user_translation_comment_params)

    if @comment.save
      redirect_to translation_path(@comment.translation_id), notice: 'コメントしました'
    else
      redirect_to translation_path(@comment.translation_id), notice: 'コメントできませんでした'
    end
  end
  private
  def user_translation_comment_params
    params.require(:user_translation_comment).permit(:content, :translation_id)
  end
end