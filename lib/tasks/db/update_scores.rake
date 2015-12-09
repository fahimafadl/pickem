namespace :db do
  desc 'Update scores based on all available scores'
  task update_scores: :environment do ||
    puts 'Starting scores update task'
    (1..17).each do |i|
      puts "Updating Week #{i} scores"
      game_data = ESPN.get_nfl_scores(2015,i)
      game_data.each do |game|
        game_to_update = Game.where(:week => i, :ht_id => game[:home_team]).first
        game_to_update.hscore = game[:home_score]
        game_to_update.ascore = game[:away_score]
        game_to_update.time = game[:game_date]
        game_to_update.save!
      end
    end
  end
end