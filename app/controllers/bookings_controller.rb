class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_boooking, only: :show

  def index
    @bookings = Booking.all
  end

  def show; end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
