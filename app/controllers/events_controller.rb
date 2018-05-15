class EventsController < ApplicationController
  def create
    @event = Event.create(user_id: (26..30).to_a.sample, book_id: params[:book_id])
    redirect_to book_event_path(book_id: @event.book_id, id: @event.id)
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
