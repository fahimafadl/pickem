class Game < ActiveRecord::Base
  validates :ht_id, :at_id, :time, :week, presence: true
  has_many :games_users
  has_many :users, through: :games_users
  has_many :teams
end
