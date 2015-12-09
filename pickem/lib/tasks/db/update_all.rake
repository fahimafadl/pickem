namespace :db do ||
  desc 'Call all other rake tasks that update the DB'
  task update_all: :environment do
    today = Date.today
    date = Date.new(2015, 9, 15)
    week = 1
    while today >= date do
      week += 1
      date = date.advance(:weeks => 1)
    end
    p(week)
    Rake::Task["db:update_scores"].invoke(week)
    Rake::Task["db:update_picks"].invoke(week)
    Rake::Task["db:update_users"].invoke
  end
end
