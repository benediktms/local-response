# frozen_string_literal: true

class JobsController < ApplicationController
  before_action :set_job, only: :show
  before_action :job_params, only: :create
  before_action :render_jobs, only: :index
  # before_action :filter_jobs?, only: :create
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    # @jobs = Job.geocoded
    @markers =
      @jobs.map do |job|
        {
          lat: job.latitude,
          long: job.longitude,
          infoWindow:
            render_to_string(partial: 'info_window', locals: { job: job })
        }
      end
  end

  def new
    @job = Job.new
  end

  def show; end

  def create
    @job = Job.new(job_params)
    @job.user_id = current_user.id
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(
      :title,
      :description,
      :address,
      :due_date,
      :category_id,
      :query,
      :start_time,
      :end_time,
      :longitude,
      :latitude,
      :price
    )
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def filter_jobs?
    # will return true if current_user (i) has not booked job and (ii) has not posted job.
    test_array = []
    test_array << @job.user_id
    @job.bookings.each { |booking| test_array << booking.user.id }
    if user_signed_in?
      return true unless test_array.include? current_user.id
    else
    end
  end
  helper_method :filter_jobs?

  def render_jobs
    @jobs_selection =
      if params[:job].present?
        Job.geocoded.where(category_id: params[:job][:query])
      else
        Job.geocoded
      end
    @jobs =
      if current_user
        @jobs_selection.where("user_id != '#{current_user.id}'")
      else
        @jobs_selection
      end
  end

end
