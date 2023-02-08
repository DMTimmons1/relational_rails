class TeamPlayersController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @team_players = @team.players
  end

  def new
    @team = Team.find(params[:team_id])
  end

  def create
    @team = Team.find(params[:team_id])
    player = Player.create(player_params)
    redirect_to "/teams/#{@team.id}/players/"
  end

private
  def player_params
    params.permit(:id, :name, :age, :height_in_cm, :position, :is_a_rookie, :team_id)
  end
end