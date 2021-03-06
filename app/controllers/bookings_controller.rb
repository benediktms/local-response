# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[show complete decline]
  before_action :any_received_booking_not_confirmed_and_not_declined?
  before_action :any_received_booking_confirmed_not_completed?
  before_action :any_received_booking_completed?
  before_action :any_requested_booking_not_confirmed?
  before_action :any_requested_booking_confirmed_not_completed?
  before_action :any_requested_booking_completed?

  def index
    # could be moved to pages view, pages controller as def dashboard
    # @received_bookings are the bookings received by current_user (as person seeking help)
    booking_array = []
    Booking.all.each do |booking|
      if booking.job.user_id == current_user.id
        # booking_array << booking if booking.job.user_id == current_user.id
        booking_array.push(booking)
      end
    end

    @received_bookings = booking_array

    @jobs = Job.where(user_id: current_user.id)
    # @requested_bookings are the bookings made by current_user (as volunteer)
    @requested_bookings = Booking.where(user_id: current_user.id)
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
    @booking.completed = false
    @booking.confirmed = false
    @booking.declined = false
    if @booking.save
      @chatroom = Chatroom.create({booking: @booking, name: @booking.job.title})
      redirect_to bookings_path
    else
      render 'jobs'
    end
  end

  def show
    # TODO: render the current user's address as a map marker
    @chatroom = @booking.chatroom
    @message = Message.new
    @markers = []
    # user's home coordinates
    @markers << { lat: @booking.user.latitude, long: @booking.user.longitude }
    # current job coordinates
    @markers << { lat: @booking.job.latitude, long: @booking.job.longitude }
  end

  def confirm
    set_booking
    @booking.confirmed = true
    @booking.save
    decline
    redirect_to bookings_path
  end

  def complete
    # @booking = Booking.find(params[:id])
    @booking.completed = true
    @booking.save
    redirect_to bookings_path
  end

  def edit
    set_booking
  end

  def update
    set_booking
    if @booking.update(booking_params)
    redirect_to bookings_path
    else
    render :edit
    end
  end


  def decline
    # get all bookings that are not the current booking and that match the current job
    @job = @booking.job
    @job.bookings.each do |booking|
      booking.declined = true unless booking.confirmed
      booking.save
    end
    # get all bookings that are not the current booking and that match the current job
    # @bookings = Booking.where(id: !@booking.id).select { |booking| booking.job == @job }
    # set declined on all those bookings == true
    # @bookings.each do |booking|
    # booking.declined = true
  end
  # TODO: create a section for this in the view, the instance of the booking will have to be passed through a link_to tag

  private

  def booking_params
    params.require(:booking).permit(invoices: [])
  end

  def set_booking
    # raise
    @booking = Booking.find(params[:id])
  end

  # this method will return true if there is at least one received_booking not confirmed and not declined
  def any_received_booking_not_confirmed_and_not_declined?
    count = 0
    index
    @received_bookings.each do |booking|
      count += 1 if !booking.confirmed && !booking.declined
    end
    true if count.positive?
  end
  helper_method :any_received_booking_not_confirmed_and_not_declined?

  # this method will return true if there is at least one received_booking confirmed and not completed
  def any_received_booking_confirmed_not_completed?
    count = 0
    index
    @received_bookings.each do |booking|
      count += 1 if booking.confirmed && !booking.completed
    end
    true if count.positive?
  end
  helper_method :any_received_booking_confirmed_not_completed?

  # this method will return true if there is at least one received_booking completed
  def any_received_booking_completed?
    count = 0
    index
    @received_bookings.each { |booking| count += 1 if booking.completed }
    true if count.positive?
  end
  helper_method :any_received_booking_completed?

  # this method will return true if there is at least one requested_booking not confirmed
  def any_requested_booking_not_confirmed?
    count = 0
    index
    @requested_bookings.each do |booking|
      count += 1 if !booking.confirmed
    end
    true if count.positive?
  end
  helper_method :any_requested_booking_not_confirmed?

  # this method will return true if there is at least one requested_booking confirmed and not completed
  def any_requested_booking_confirmed_not_completed?
    count = 0
    index
    @requested_bookings.each do |booking|
      count += 1 if booking.confirmed && !booking.completed
    end
    true if count.positive?
  end
  helper_method :any_requested_booking_confirmed_not_completed?

  # this method will return true if there is at least one requested_booking completed
  def any_requested_booking_completed?
    count = 0
    index
    @requested_bookings.each { |booking| count += 1 if booking.completed }
    true if count.positive?
  end
  helper_method :any_requested_booking_completed?
end
