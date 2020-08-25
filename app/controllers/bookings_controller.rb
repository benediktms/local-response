class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_booking, only: %i[show complete_booking]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @job = Job.find(params[:job_id])
    @booking.user_id = current_user.id
    # @booking.confirmed_datetime = @booking.job.due_date
    @booking.job_id = @job.id
    @booking.completed = 'false'
    @booking.confirmed = 'false'
    if @booking.save
      redirect_to bookings_path
    else
      render 'jobs'
    end
  end

  def show; end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def complete_booking
    @booking.completed = true
  end
end
