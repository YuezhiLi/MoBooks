class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to my_books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book.update(book_params)
    if @book.save
      redirect_to my_books_path
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to my_books_path
  end

  def my_books
    @user = User.find((26..30).to_a.sample)
    @my_books = @user.books
    @my_borrowed_books = @user.borrowed_books
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :cover)
  end
end
