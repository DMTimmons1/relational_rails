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
    team = Team.create(name: params[:name])
    redirect_to "/teams"
  end

end