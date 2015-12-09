class PicksController < ApplicationController
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
        make_updates(@pick.week)
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
        make_updates(@pick.week)
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

  def make_updates(week)
    Pick.where(:week => week).find_each do |pick|
      game = Game.find(pick.game_id)
      unless game.hscore.nil?
        pick.result = 1 if game.hscore > game.ascore
        pick.result = 2 if game.hscore < game.ascore
        pick.result = 3 if game.hscore == game.ascore
        pick.save!
      end
    end
    User.find_each do |user|
      @user_record = user.user_record
      @wins = 0
      @losses = 0
      @ratio = 0.0
      Pick.where(:user_id => user.id).find_each do |pick|
        @wins += 1 if pick.result == pick.pick
        @losses += 1 if pick.result != pick.pick && pick.result != 0
      end
      if @wins == 0
        @ratio = 0.0
      elsif @wins > 0 && @losses == 0
        @ratio = 1.0
      else
        @ratio = @wins.to_f/(@losses.to_f+@wins.to_f)
      end
      @ratio = (@ratio * 10000).round / 10000.0
      @user_record.wins = @wins
      @user_record.losses = @losses
      @user_record.total = @wins + @losses
      @user_record.ratio = @ratio
      @user_record.save!
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
