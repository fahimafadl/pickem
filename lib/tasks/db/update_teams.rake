namespace :db do | |
  desc 'Update the record of each team based on the results of a given week'
  task update_teams: :environment do |t, args|
    Team.find_each do |team|
      team.wins = 0
      team.losses = 0
      team.save!
    end
    Game.find_each do |game|
      home = Team.where(:team_id => game.ht_id).first
      away = Team.where(:team_id => game.at_id).first
      unless game.hscore.nil?
        if game.hscore > game.ascore
          home.wins += 1
          away.losses += 1
        elsif game.hscore < game.ascore
          home.losses += 1
          away.wins += 1
        else
        end
        home.save!
        away.save!
      end
    end
  end
end