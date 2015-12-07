class Pick < ActiveRecord::Base
  validates :user_id, :game_id, :pick, :result, presence: true
  validates :pick, inclusion: { in: [1, 2] }
  validates :result, inclusion: { in: [0, 1, 2] }
  belongs_to :user
  belongs_to :game
end
