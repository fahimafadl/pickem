class PicksController < ApplicationController
  require 'rake'
  Rake::Task.clear
  Pickem::Application.load_tasks
  before_action :set_pick, only: [:show, :edit, :update, :destroy]

  # GET /picks
  # GET /picks.json
  def index
    @picks = Pick.all
  end

  # GET /picks/1
  # GET /picks/1.json
  def show
  end

  # GET /picks/new
  def new
    @pick = Pick.new
    @game = Game.find(params[:id])
    @home = Team.where(:team_id => @game.ht_id).first
    @away = Team.where(:team_id => @game.at_id).first
  end

  # GET /picks/1/edit
  def edit
    @pick = Pick.find(params[:id])
    @game = @pick.game
    @home = Team.where(:team_id => @game.ht_id).first
    @away = Team.where(:team_id => @game.at_id).first
  end

  # POST /picks
  # POST /picks.json
  def create
    @pick = Pick.new(pick_params)
    @pick.result = 0
    @pick.user_id = current_user.id
    @pick.game_id = Game.find(params[:game_id]).id
    @pick.week = Game.find(params[:game_id]).week

    respond_to do |format|
      if @pick.save
        Rake::Task["db:update_picks"].invoke(@pick.week)
        Rake::Task["db:update_users"].invoke
        format.html { redirect_to current_user, notice: 'Pick was successfully created.' }
        format.json { render :show, status: :created, location: @pick }
      else
        format.html { render :new }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /picks/1
  # PATCH/PUT /picks/1.json
  def update
    respond_to do |format|
      if @pick.update(pick_params)
        Rake::Task["db:update_picks"].invoke(@pick.week)
        Rake::Task["db:update_users"].invoke
        format.html { redirect_to current_user, notice: 'Pick was successfully updated.' }
        format.json { render :show, status: :ok, location: @pick }
      else
        format.html { render :edit }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /picks/1
  # DELETE /picks/1.json
  def destroy
    @pick.destroy
    respond_to do |format|
      format.html { redirect_to picks_url, notice: 'Pick was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pick
      @pick = Pick.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pick_params
      params.require(:pick).permit(:game_id, :user_id, :pick, :result, :week)
    end
end
