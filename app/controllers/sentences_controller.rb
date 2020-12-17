class SentencesController < ApplicationController
  before_action :admin_user, only: [:edit, :update, :destroy]
  before_action :set_sentence, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:show]

  def show
    @book = @sentence.book
    @translations = Translation.where(sentence_id: @sentence.id).includes(:user).order(id: :desc)
  end

  def edit
  end

  def update
    if @sentence.update(sentence_params)
      redirect_to book_path(@sentence.book_id), notice: t('.edited_sentence')
    else
      render :edit
    end
  end

  def destroy
    @sentence.destroy
    redirect_to book_path(@sentence.book_id), notice: t('.destroyed_sentence')
  end

  private
  def set_sentence
    @sentence = Sentence.find(params[:id])
  end

  def sentence_params
    params.require(:sentence).permit(:content)
  end
end
