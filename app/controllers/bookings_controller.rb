class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_booking, only: :show

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @job = Job.find(params[:id])
    @booking = Booking.new
    @booking.user_id = current_user
    @booking.job = @job
    if @booking.save
      redirect_to jobs_path
    else
      render 'jobs'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
