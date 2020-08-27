class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index #could be moved to pages view, pages controller as def dashboard
    booking_array = Booking.where(user_id: current_user.id)
    Booking.all.each do |booking|
      booking_array << booking if booking.job.user_id == current_user.id
      end
    @bookings = booking_array
    @jobs = Job.where(user_id: current_user.id)
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

  def show
    @booking = Booking.find(params[:id])
  end

  private



end
