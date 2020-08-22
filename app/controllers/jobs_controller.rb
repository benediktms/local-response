class JobsController < ApplicationController
  before_action :set_job, only: :show
  before_action :job_params, only: :create
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @jobs = Job.geocoded
    @markers = @jobs.map do |job|
      {
        lat: job.latitude,
        long: job.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { job: job })
      }
    end
  end

  def new
    @job = Job.new
  end

  def show; end

  def create
    @job = Job.new
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
    params.require(:job).permit(:title, :description, :address, :due_date, :start_time, :end_time, :longitude, :latitude, :price)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
