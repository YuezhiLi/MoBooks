class Api::V1::EventsController < Api::V1::BaseController
  def create
    @book = Book.find(params[:book_id])
    if @book.available
      @event = Event.create(user_id: @current_user.id, book_id: params[:book_id])
      @event.book.update(available: false)
      render :show
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(borrowed: false)
    @event.book.update(available: true)
  end

end
