class Game < ActiveRecord::Base
  validates :ht_id, :at_id, :time, :week, presence: true
  has_many :picks
  has_many :teams
end
