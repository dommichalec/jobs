# Company controller
class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end
end
