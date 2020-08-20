class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
