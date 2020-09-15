class JobsController < ApplicationController
  before_action :set_job, only: :show
  before_action :job_params, only: :create
  before_action :render_jobs, only: :index
  # before_action :filter_jobs?, only: :create
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
   render_jobs
      @markers = @jobs.map do |job|
        {
          lat: job.latitude,
          long: job.longitude,
          infoWindow: render_to_string(partial: 'info_window', locals: { job: job })
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
    params.require(:job).permit(:title, :description, :address, :due_date, :category_id, :query, :start_time, :end_time, :longitude, :latitude, :price)
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def filter_jobs?
    # will return true if current_user (i) has not booked job and (ii) has not posted job.
    test_array = []
    test_array << @job.user_id
    @job.bookings.each do |booking|
      test_array << booking.user.id
    end
    return true unless test_array.include? current_user.id
  end
  helper_method :filter_jobs?

  def render_jobs
   @jobs = if current_user && params[:job].present?
            Job.geocoded.where("user_id != '#{current_user.id}'", category_id: params[:job][:query])
            elseif current_user && !params[:job].present?
            Job.geocoded.where("user_id != '#{current_user.id}'")
            elseif !current_user && params[:job].present?
            Job.where(category_id: params[:job][:query])
            elseif !current_user && !params[:job].present?
            Job.geocoded
            end
  end
end
