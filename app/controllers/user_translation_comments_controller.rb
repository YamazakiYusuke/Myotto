class UserTranslationCommentsController < ApplicationController
  before_action :set_translation, only: [:create, :edit, :update]

  def create
    @comment = @translation.user_translation_comments.build(comment_params)
    @comment[:user_id] = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to translation_path(@translation), alert: "You can't comment" }
      end
    end
  end

  def edit
    @comment = @translation.user_translation_comments.find(params[:id])
    respond_to do |format|
      format.js { render :edit }
    end
  end

  def update
    @comment = @translation.user_translation_comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        flash.now[:notice] = "You edit a comment"
        format.js { render :index }
      else
        flash.now[:alert] = "You failed to edit a comment"
        format.js { render :edit_error }
      end
    end
  end

  def destroy
    @comment = UserTranslationComment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:alert] = "You deleted a comment"
      format.js { render :index }
    end
  end

  private
  def comment_params
    params.require(:user_translation_comment).permit(:translation_id, :content, :user_id)
  end

  def set_translation
    @translation = Translation.find(params[:translation_id])
  end

  def own_comment?
    unless current_user.id == @comment.user_id
      flash.now[:alert] = "Unaccessible"
      format.js { render :index }
    end
  end
end