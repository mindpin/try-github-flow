class TeamsController < ApplicationController
  def new
    @team =  Team.new
    @company = Company.find(params[:company_id])
  end

  def create
    @team_name = params[:team][:team_name]
    @company_id = params[:company_id]
    @employee_ids = params[:team][:employee_ids]
    @team = Team.new(team_name: @team_name, company_id: @company_id, employee_ids: @employee_ids)
    if @team.save
      redirect_to "/companies/#{params[:company_id]}/teams"
    else
      redirect_to "/companies/#{params[:company_id]}/teams/new"
    end
  end

  def edit
    @team = Team.find(params[:id])
    @company = Company.find(params[:company_id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(params_team)
      redirect_to "/companies/#{params[:company_id]}/teams"
    else
      redirect_to "/companies/#{params[:company_id]}/teams/#{params[:id]}/edit"
    end
  end

  def index
    @team = Team.all 
    @company = Company.find(params[:company_id])
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to "/companies/#{params[:company_id]}/teams"
  end

  def show
    @team = Team.find(params[:id])
    @company = Company.find(params[:company_id])
  end

  private
    def params_team
      params.require(:team).permit(:team_name)
    end
end