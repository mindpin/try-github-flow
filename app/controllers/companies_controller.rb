class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def index
    @company = Company.all
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to "/companies"
    else
      redirect_to "/companies/new"
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
      redirect_to "/companies"
    else
      redirect_to "/companies/#{params[:id]}/edit"
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to "/companies"
  end

  private 
    def company_params
      params.require(:company).permit(:company_name, :company_address)
    end
end