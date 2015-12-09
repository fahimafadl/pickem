class GamesController < ApplicationController
  before_action :set_game, only: [:show]

  def index
    @week = params[:week]
    @games = Game.where(:week => @week)
  end

  def show
    @home = Team.where(:team_id => @game.ht_id).first
    @away = Team.where(:team_id => @game.at_id).first
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
