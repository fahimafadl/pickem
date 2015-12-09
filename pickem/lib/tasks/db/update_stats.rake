require 'open-uri'

namespace :db do | |
  desc 'Update the stats of each team'
  task update_stats: :environment do
    puts "Updating offensive stats"

    off_season_stats = Nokogiri::HTML(open("http://www.nfl.com/stats/categorystats?tabSeq=2&offensiveStatisticCategory=GAME_STATS&conference=ALL&role=TM&season=2015&seasonType=REG&d-447263-s=TOTAL_YARDS_GAME_AVG&d-447263-o=2&d-447263-n=1").read)
    rows = off_season_stats.xpath('//table/tbody[1]/tr')
    details = rows.collect do |row|
      detail = {}
      [
       [:name, 'td[2]/a/text()'],
       [:ypg, 'td[7]/text()']
      ].each do |name, xpath|
        detail[name] = row.at_xpath(xpath).to_s.strip
      end
      detail
    end
    details.each do |detail|
      team = Team.where(name: detail[:name]).first
      team.off_pass_ypg = detail[:ypg]
      team.save
      puts team.id
    end
    puts details
  end
end