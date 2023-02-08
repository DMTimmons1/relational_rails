class PlayersController < ApplicationController
  def index
    @players = Player.all.where("is_a_rookie = true")
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    player = Player.find(params[:id])
    player.update(player_params)
    redirect_to "/players/#{player.id}"
  end

private
  def player_params
    params.permit(:id, :name, :age, :height_in_cm, :position, :is_a_rookie, :team_id)
  end
end