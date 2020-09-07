class ReviewsController < ApplicationController

  before_action :find_booking

  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.user_id = @booking.user.id
    @review.booking_id = @booking.id
    if @review.save
      redirect_to bookings_path
      else
      render :new
    end
  end
  
  def destroy
   @review = Review.find(params[:booking_id])
   @review.destroy
   redirect_to booking_path(@booking)
  end
  
private

  def find_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
