class UserRecord < ActiveRecord::Base
  validates :wins, :losses, :total, :ratio, presence: true
  belongs_to :user
end
