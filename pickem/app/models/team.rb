class Team < ActiveRecord::Base
  validates :name, :team_id, presence: true
  has_many :games
end
