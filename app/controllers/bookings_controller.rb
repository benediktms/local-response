class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_booking, only: %i[show complete decline]

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

  def complete
    # @booking = Booking.find(params[:id])
    @booking.completed = true
    @booking.save
    redirect_to bookings_path
  end

  def decline
    # get all bookings that are not the current booking and that match the current job
    @bookings = Booking.where(id: !@booking.id).select { |booking| booking.job == @booking.job }
    # set declined on all those bookings == true
    @bookings.each do |booking|
      booking.declined = true
    end
  end

  private

  def set_booking
    # raise
    @booking = Booking.find(params[:id])
  end
end
