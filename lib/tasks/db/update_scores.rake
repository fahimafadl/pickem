namespace :db do
  desc 'Update scores based on all available scores'
  task :update_scores, [:week] => :environment do |t, args|
    puts 'Starting scores update task'
    (args[:week]..17).each do |i|
      puts "Updating Week #{i} scores"
      game_data = ESPN.get_nfl_scores(2015,i)
      game_data.each do |game|
        Game.create(:time => game[:game_date], :ht_id => game[:home_team], :hscore => game[:home_score], :at_id => game[:away_team], :ascore => game[:away_score], :week => i)
      end
    end
  end
end