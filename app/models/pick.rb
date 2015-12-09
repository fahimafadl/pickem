class Pick < ActiveRecord::Base
  validates :user_id, :game_id, :pick, :result, presence: true
  validates :pick, inclusion: { in: [1, 2, 3] }
  validates :result, inclusion: { in: [0, 1, 2, 3] }
  belongs_to :user
  belongs_to :game
end
