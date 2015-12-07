class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    set_team
  end

  def set_team
    @team = Team.find(params[:id])
  end
end
