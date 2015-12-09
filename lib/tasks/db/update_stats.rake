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
      team.off_tot_ypg = detail[:ypg]
      team.save
      puts team.id
    end
    puts details

    off_season_stats = Nokogiri::HTML(open("http://www.nfl.com/stats/categorystats?archive=false&conference=null&role=TM&offensiveStatisticCategory=TEAM_PASSING&defensiveStatisticCategory=null&season=2015&seasonType=REG&tabSeq=2&qualified=false&Submit=Go").read)
    rows = off_season_stats.xpath('//table/tbody[1]/tr')
    details = rows.collect do |row|
      detail = {}
      [
       [:name, 'td[2]/a/text()'],
       [:ypg, 'td[12]/text()']
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

    off_season_stats = Nokogiri::HTML(open("http://www.nfl.com/stats/categorystats?seasonType=REG&offensiveStatisticCategory=RUSHING&d-447263-n=1&d-447263-o=2&d-447263-p=1&d-447263-s=RUSHING_YARDS_PER_GAME_AVG&tabSeq=2&season=2015&role=TM&Submit=Go&archive=false&conference=null&defensiveStatisticCategory=null&qualified=false").read)
    rows = off_season_stats.xpath('//table/tbody[1]/tr')
    details = rows.collect do |row|
      detail = {}
      [
       [:name, 'td[2]/a/text()'],
       [:ypg, 'td[10]/text()']
      ].each do |name, xpath|
        detail[name] = row.at_xpath(xpath).to_s.strip
      end
      detail
    end
    details.each do |detail|
      team = Team.where(name: detail[:name]).first
      team.off_rush_ypg = detail[:ypg]
      team.save
      puts team.id
    end
    puts details

    off_season_stats = Nokogiri::HTML(open("http://www.nfl.com/stats/categorystats?archive=false&conference=null&role=OPP&offensiveStatisticCategory=null&defensiveStatisticCategory=TOTAL_YARDS&season=2015&seasonType=REG&tabSeq=2&qualified=false&Submit=Go").read)
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
      team.def_tot_ypg = detail[:ypg]
      team.save
      puts team.id
    end
    puts details

      off_season_stats = Nokogiri::HTML(open("http://www.nfl.com/stats/categorystats?archive=false&conference=null&role=OPP&offensiveStatisticCategory=null&defensiveStatisticCategory=TEAM_PASSING&season=2015&seasonType=REG&tabSeq=2&qualified=false&Submit=Go").read)
    rows = off_season_stats.xpath('//table/tbody[1]/tr')
    details = rows.collect do |row|
      detail = {}
      [
       [:name, 'td[2]/a/text()'],
       [:ypg, 'td[12]/text()']
      ].each do |name, xpath|
        detail[name] = row.at_xpath(xpath).to_s.strip
      end
      detail
    end
    details.each do |detail|
      team = Team.where(name: detail[:name]).first
      team.def_pass_ypg = detail[:ypg]
      team.save
      puts team.id
    end
    puts details

    off_season_stats = Nokogiri::HTML(open("http://www.nfl.com/stats/categorystats?archive=false&conference=null&role=OPP&offensiveStatisticCategory=null&defensiveStatisticCategory=RUSHING&season=2015&seasonType=REG&tabSeq=2&qualified=false&Submit=Go").read)
    rows = off_season_stats.xpath('//table/tbody[1]/tr')
    details = rows.collect do |row|
      detail = {}
      [
       [:name, 'td[2]/a/text()'],
       [:ypg, 'td[10]/text()']
      ].each do |name, xpath|
        detail[name] = row.at_xpath(xpath).to_s.strip
      end
      detail
    end
    details.each do |detail|
      team = Team.where(name: detail[:name]).first
      team.def_rush_ypg = detail[:ypg]
      team.save
      puts team.id
    end
    puts details
  end
end