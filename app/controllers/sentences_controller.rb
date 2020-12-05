class SentencesController < ApplicationController
  before_action :set_sentence, only: [:show, :edit, :update, :destroy]

  def index
    @sentences = Sentence.all
  end

  def show
  end

  def new
    @sentence = Sentence.new
  end

  def create
    @sentence = Sentence.new(sentence_params)
    if params[:back]
      render :new
    else
      if @sentence.save
        redirect_to sentences_path
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    binding.pry
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
