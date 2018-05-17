class Api::V1::BooksController < Api::V1::BaseController
  before_action :set_book, only: [ :show, :update, :destroy ]

  def index
    @books = Book.where(available: true)
  end

  def show
  end

  def my_books
    @user = @current_user
    @my_books = @user.books
    @my_reading_list = @user.borrowed_books.select { |b| b.events.last.user_id == @user.id && b.available == false }
    @my_read_list = @user.borrowed_books.select { |b| b.events.last.user_id != @user.id || b.available == true }
  end

  def create
    @book = Book.new(book_params)
    @book.user = @current_user
    if @book.save
      render :my_books
    else
      render_error
    end
  end

  def update
    if @book.update(book_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @book.destroy
    head :no_content
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description, :cover)
  end

  def render_error
    render json: { errors: @book.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
