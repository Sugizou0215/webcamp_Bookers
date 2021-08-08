class BooksController < ApplicationController

  def index

    @books = Book.all
    @book = Book.new #新規投稿機能のため新規カラム生成

  end

  def show

    @book = Book.find(params[:id])

  end

  def new
  end

  def create
    @book = Book.new(book_params)
    #title,bodyに入力がある場合
    if @book.save
      redirect_to book_path(@book.id), notice: 'Book was successfully created.'
    #title,bodyに入力がない場合
    else
      @books = Book.all #一覧を表示させるためbooksにすべてのカラムを代入
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

   # ストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
