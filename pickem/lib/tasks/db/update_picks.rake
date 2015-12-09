namespace :db do | |
  desc 'Update the results of each pick'
  task :update_picks, [:week] => :environment do |t, args|
    Pick.where(:week => args[:week]).find_each do |pick|
      game = Game.find(pick.game_id)
      pick.result = 1 if game.hscore > game.ascore
      pick.result = 2 if game.hscore < game.ascore
      pick.result = 3 if game.hscore == game.ascore
      pick.save!
    end
  end
end