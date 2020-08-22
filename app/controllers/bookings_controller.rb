class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_boooking, only: :show

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    if @booking.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
