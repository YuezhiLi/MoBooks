class Api::V1::EventsController < Api::V1::BaseController
  def create
    @event = Event.create(user_id: @current_user.id, book_id: params[:book_id])
    render :show
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.borrowed = false
    @event.save
  end
end
