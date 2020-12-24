class UserTranslationCommentsController < ApplicationController
  before_action :set_translation, only: [:create, :edit, :update]
  def create
    @comment = @translation.user_translation_comments.build(comment_params)
    @comment[:user_id] = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to translation_path(@translation), notice: t('.fale_to_comment') }
      end
    end
  end
  def edit
    @comment = @translation.user_translation_comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = t('.fale')
      format.js { render :edit }
    end
  end
  def update
    @comment = @translation.user_translation_comments.find(params[:id])
    @comment[:user_id] = current_user.id
    respond_to do |format|
      if @comment.update(comment_params)
        flash.now[:notice] = t('.edited_comment')
        format.js { render :index }
      else
        flash.now[:notice] = ｈ
        format.js { render :edit_error }
      end
    end
  end
  def destroy
    @comment = UserTranslationComment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = t('.destroyed_comment')
      format.js { render :index }
    end
  end
  private
  def comment_params
    params.require(:user_translation_comment).permit(:translation_id, :content)
  end
  def set_translation
    @translation = Translation.find(params[:translation_id])
  end
  def own_comment?
    unless current_user.id == @comment.user_id
      format.js { render :index }
    end
  end
end