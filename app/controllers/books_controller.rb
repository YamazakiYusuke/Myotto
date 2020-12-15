class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @search = Book.ransack(params[:q])
    @books = @search.result.includes(book_locale_statuses: :locale)
  end

  def show
  end

  def new
    @book = Book.new
    @book.book_locale_statuses.build if @book.book_locale_statuses.size == 0
  end

  def create 
    @book =  current_user.books.new(book_params)
    if @book.save
      Sentence.make_sentences_from_book(@book.book_locale_statuses[0].locale_id, @book.id, params[:book][:content])
      redirect_to books_path, notice: "本を登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to books_path, notice: '本を編集しました'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: '本を削除しました'
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :issued_date, book_locale_statuses_attributes: [:locale_id, :book_id, :is_main, :difficulty])
  end
end
