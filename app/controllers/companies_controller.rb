# Company controller
class CompaniesController < ApplicationController
  def index
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
    if @company.save
      @company.update(company_params)
    else
      render :edit
    end
    redirect_to company_path(@company)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    if @company.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :headquarters_location, :url, :stack, :size, :industry, :about_us)
  end
end
