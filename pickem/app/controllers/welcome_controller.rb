class WelcomeController < ApplicationController
  require 'espn_scraper'
  def index
    test = ESPN.get_nfl_scores(2015,17)
    p(test)
  end
end
