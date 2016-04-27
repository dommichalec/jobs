# Company controller
class CompaniesController < ApplicationController
  before_action :require_signin

  def index
    @user = User.find(params[:user_id])
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to company_path(@company), notice: "#{@company.name} has been successfully updated!"
    else
      render :edit
    end
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    if @company.save
      redirect_to company_path(@company), notice: "#{@company.name} has been successfully added!"
    else
      render :new
    end
  end

  def destroy
    @company = Company.find(params[:id])
    company_name = @company.name
    @company.destroy
    redirect_to companies_url, notice: "#{company_name} and all associated postings have been successfully deleted!"
  end

  private

  def company_params
    params.require(:company).
      permit(:name, :headquarters_location, :url, :stack, :size, :founded_in, :industry, :about_us, :open_source_projects_url, :logo, :careers_page_url)
  end
end
