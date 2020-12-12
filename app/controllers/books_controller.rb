class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_locale, only: [:new, :edit]

  def index
    @books = Book.all.includes(book_locale_statuse: :locale)
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create  #<= fat code 要リファクタ
    @book =  current_user.books.new(book_params)
    if @book.save
      @locale_statuse = BookLocaleStatuse.new(book_locale_statuse_params)
      @locale_statuse[:is_main] = true
      @locale_statuse[:book_id] = @book.id
      @locale_statuse.save
      Sentence.make_sentences_from_book(@locale_statuse.locale_id, @book.id, params[:book][:content])
      redirect_to books_path, notice: "本を登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      @book.book_locale_statuse.update(book_locale_statuse_params)
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

  def set_locale
    @locales = Locale.all
  end

  def book_params
    params.require(:book).permit(:title, :author, :issued_date)
  end

  def book_locale_statuse_params
    params.require(:book).permit(:locale_id, :difficulty)
  end
end
