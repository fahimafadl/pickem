# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
division_data = ESPN.get_divisions
division_data["nfl"].each do |division|
  Division.create(:name => division[:name], :data_name => division[:data_name])
end

team_data = ESPN.get_teams_in('nfl')
team_data.each do |division, teams|
  teams.each do |team|
    logo = "/images/" + team[:data_name] + ".jpg"
    Team.create(:team_id => team[:data_name], :name => team[:name], :logo_url => logo, :wins => 0, :losses => 0, :played => 0, :off_pass_ypg => 0, :off_tot_ypg => 0, :off_rush_ypg => 0, :def_tot_ypg => 0, :def_rush_ypg => 0, :def_pass_ypg => 0, :division => division)
  end
end

(1..12).each do |i|
  game_data = ESPN.get_nfl_scores(2015,i)
  game_data.each do |game|
    Game.create(:time => game[:game_date], :ht_id => game[:home_team], :hscore => game[:home_score], :at_id => game[:away_team], :ascore => game[:away_score], :week => i)
  end
end
