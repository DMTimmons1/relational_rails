class TeamPlayersController < ApplicationController
  def index
    @team_player = Team.find(params[:player_id])
    @team_players = @team_player.players
  end
end