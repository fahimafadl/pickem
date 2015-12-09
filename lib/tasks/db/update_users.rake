namespace :db do | |
  desc 'Update the wins, losses, ratio, and total picks of each user'
  task update_users: :environment do
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
        @ratio = 100.0
      else
        @ratio = @wins.to_f/(@losses.to_f+@wins.to_f)
      end
      @user_record.wins = @wins
      @user_record.losses = @losses
      @user_record.total = @wins + @losses
      @user_record.ratio = @ratio
      @user_record.save!
    end
  end
end