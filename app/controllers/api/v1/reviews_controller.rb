class Api::V1::ReviewsController < Api::V1::BaseController
  before_action :set_review, only: [ :show, :update, :destroy ]

  def create
    @event = Event.find(params[:event_id])
    @review = Review.new(review_params)
    @review.user = @current_user
    @review.event = @event
    if @review.save
      render :show
    else
      render_error
    end
  end

  def show
  end

  def update
    if @review.update(review_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @review.destroy
    header :no_content
  end

  private
  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def render_error
    render json: { errors: @review.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
