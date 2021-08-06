class BooksController < ApplicationController

  def index
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    
    book = Book.new(book_params)
    book.save
    redirect_to root_path
  end

  def edit
  end


   # ストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
