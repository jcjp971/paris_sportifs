class TeamsController < ApplicationController
  before_action :set_team, only: %i[show update]
  def index
    if params[:team].present?
      @teams = Team.where("name ILIKE ?", "%#{params[:team]}%")
    else
      @teams = Team.all.order(id: :asc)
    end
  end

  def edit
  end

  def show
  end

  def update
    @team.name = team_params[:name]
    @team.logo = team_params[:logo]
    @team.name2 = team_params[:name2]
    @team.name3 = team_params[:name3]
    if @team.save
      redirect_to team_path(@team)
    else
      render :show
    end
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :logo, :name2, :name3)
  end
end
