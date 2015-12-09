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

(1..13).each do |i|
  game_data = ESPN.get_nfl_scores(2015,i)
  game_data.each do |game|
    Game.create(:time => game[:game_date], :ht_id => game[:home_team], :hscore => game[:home_score], :at_id => game[:away_team], :ascore => game[:away_score], :week => i)
  end
end

game = Game.new(:at_id => "min", :ht_id => "ari", :week => 14)
game.save!
game = Game.new(:at_id => "buf", :ht_id => "phi", :week => 14)
game.save!
game = Game.new(:at_id => "sea", :ht_id => "bal", :week => 14)
game.save!
game = Game.new(:at_id => "sf", :ht_id => "cle", :week => 14)
game.save!
game = Game.new(:at_id => "det", :ht_id => "stl", :week => 14)
game.save!
game = Game.new(:at_id => "ten", :ht_id => "nyj", :week => 14)
game.save!
game = Game.new(:at_id => "pit", :ht_id => "cin", :week => 14)
game.save!
game = Game.new(:at_id => "ind", :ht_id => "jax", :week => 14)
game.save!
game = Game.new(:at_id => "sd", :ht_id => "kc", :week => 14)
game.save!
game = Game.new(:at_id => "wsh", :ht_id => "chi", :week => 14)
game.save!
game = Game.new(:at_id => "atl", :ht_id => "car", :week => 14)
game.save!
game = Game.new(:at_id => "no", :ht_id => "tb", :week => 14)
game.save!
game = Game.new(:at_id => "oak", :ht_id => "den", :week => 14)
game.save!
game = Game.new(:at_id => "dal", :ht_id => "gb", :week => 14)
game.save!
game = Game.new(:at_id => "ne", :ht_id => "hou", :week => 14)
game.save!
game = Game.new(:at_id => "nyg", :ht_id => "mia", :week => 14)
game.save!

game = Game.new(:at_id => "tb", :ht_id => "stl", :week => 15)
game.save!
game = Game.new(:at_id => "nyj", :ht_id => "dal", :week => 15)
game.save!
game = Game.new(:at_id => "car", :ht_id => "nyg", :week => 15)
game.save!
game = Game.new(:at_id => "ten", :ht_id => "ne", :week => 15)
game.save!
game = Game.new(:at_id => "buf", :ht_id => "wsh", :week => 15)
game.save!
game = Game.new(:at_id => "kc", :ht_id => "bal", :week => 15)
game.save!
game = Game.new(:at_id => "hou", :ht_id => "ind", :week => 15)
game.save!
game = Game.new(:at_id => "atl", :ht_id => "jax", :week => 15)
game.save!
game = Game.new(:at_id => "chi", :ht_id => "min", :week => 15)
game.save!
game = Game.new(:at_id => "gb", :ht_id => "oak", :week => 15)
game.save!
game = Game.new(:at_id => "cle", :ht_id => "sea", :week => 15)
game.save!
game = Game.new(:at_id => "cin", :ht_id => "sf", :week => 15)
game.save!
game = Game.new(:at_id => "mia", :ht_id => "sd", :week => 15)
game.save!
game = Game.new(:at_id => "den", :ht_id => "pit", :week => 15)
game.save!
game = Game.new(:at_id => "ari", :ht_id => "phi", :week => 15)
game.save!
game = Game.new(:at_id => "det", :ht_id => "no", :week => 15)
game.save!

game = Game.new(:at_id => "sd", :ht_id => "oak", :week => 16)
game.save!
game = Game.new(:at_id => "wsh", :ht_id => "phi", :week => 16)
game.save!
game = Game.new(:at_id => "dal", :ht_id => "buf", :week => 16)
game.save!
game = Game.new(:at_id => "cle", :ht_id => "kc", :week => 16)
game.save!
game = Game.new(:at_id => "car", :ht_id => "atl", :week => 16)
game.save!
game = Game.new(:at_id => "chi", :ht_id => "tb", :week => 16)
game.save!
game = Game.new(:at_id => "sf", :ht_id => "det", :week => 16)
game.save!
game = Game.new(:at_id => "hou", :ht_id => "ten", :week => 16)
game.save!
game = Game.new(:at_id => "ind", :ht_id => "mia", :week => 16)
game.save!
game = Game.new(:at_id => "jax", :ht_id => "no", :week => 16)
game.save!
game = Game.new(:at_id => "nyg", :ht_id => "min", :week => 16)
game.save!
game = Game.new(:at_id => "ne", :ht_id => "nyj", :week => 16)
game.save!
game = Game.new(:at_id => "gb", :ht_id => "ari", :week => 16)
game.save!
game = Game.new(:at_id => "stl", :ht_id => "sea", :week => 16)
game.save!
game = Game.new(:at_id => "pit", :ht_id => "bal", :week => 16)
game.save!
game = Game.new(:at_id => "cin", :ht_id => "den", :week => 16)
game.save!

game = Game.new(:at_id => "nyj", :ht_id => "buf", :week => 17)
game.save!
game = Game.new(:at_id => "ne", :ht_id => "mia", :week => 17)
game.save!
game = Game.new(:at_id => "tb", :ht_id => "car", :week => 17)
game.save!
game = Game.new(:at_id => "no", :ht_id => "atl", :week => 17)
game.save!
game = Game.new(:at_id => "bal", :ht_id => "cin", :week => 17)
game.save!
game = Game.new(:at_id => "pit", :ht_id => "cle", :week => 17)
game.save!
game = Game.new(:at_id => "jax", :ht_id => "hou", :week => 17)
game.save!
game = Game.new(:at_id => "ten", :ht_id => "ind", :week => 17)
game.save!
game = Game.new(:at_id => "oak", :ht_id => "kc", :week => 17)
game.save!
game = Game.new(:at_id => "wsh", :ht_id => "dal", :week => 17)
game.save!
game = Game.new(:at_id => "phi", :ht_id => "nyg", :week => 17)
game.save!
game = Game.new(:at_id => "det", :ht_id => "chi", :week => 17)
game.save!
game = Game.new(:at_id => "min", :ht_id => "gb", :week => 17)
game.save!
game = Game.new(:at_id => "sd", :ht_id => "den", :week => 17)
game.save!
game = Game.new(:at_id => "sea", :ht_id => "ari", :week => 17)
game.save!
game = Game.new(:at_id => "stl", :ht_id => "sf", :week => 17)
game.save!