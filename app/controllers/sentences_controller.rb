class SentencesController < ApplicationController
  before_action :admin_user, only: [:edit, :update, :destroy]
  before_action :set_sentence, only: [:edit, :update, :destroy]

  def edit
  end

  def update
    if @sentence.update(sentence_params)
      redirect_to book_path(@sentence.book_id), notice: 'センテンスを編集しました'
    else
      render :edit
    end
  end

  def destroy
    @sentence.destroy
    redirect_to book_path(@sentence.book_id), notice: 'センテンスを削除しました'
  end

  private
  def set_sentence
    @sentence = Sentence.find(params[:id])
  end

  def sentence_params
    params.require(:sentence).permit(:content)
  end
end
