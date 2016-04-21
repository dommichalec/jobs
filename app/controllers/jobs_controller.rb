# Jobs controller
class JobsController < ApplicationController

  def index
    @jobs = Job.last_updated
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.create(job_params)
    if @job.save
      redirect_to company_path(@company), notice: "The #{@job.title} position has been successfully added to #{@company.name}'s profile!"
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
    if @job.save
      redirect_to company_path(@company), notice: "The #{@job.title} posting has been successfully updated on #{@company.name}'s profile!"
    else
      render :edit
    end
  end
  private

  def job_params
    params.require(:job).
      permit(:title, :description, :how_apply, :available, :time_spent_in_office, :available_positions, :company_id)
  end
end
