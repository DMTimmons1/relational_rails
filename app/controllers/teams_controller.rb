class TeamsController < ApplicationController
  def index
    @teams = Team.all.order("created_at DESC")
  end

  def show
    @team = Team.find(params[:id])
    @player_count = @team.players.count
  end

  def new
  end

  def create
    team = Team.create(team_params)
    redirect_to "/teams"
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    redirect_to '/teams'
  end

  def destroy
    team = Team.find(params[:id])
    team.destroy
    redirect_to '/teams'
  end
  
private
  def team_params
    params.permit(:name, :city, :conference, :rank, :has_won_championship)
  end
end