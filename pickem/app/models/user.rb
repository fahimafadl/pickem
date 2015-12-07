class User < ActiveRecord::Base
  include BCrypt

  validates :name, :email, :password_hash, presence: true
  validates :name, :email, uniqueness: true
  has_many :picks
  has_one :user_record
  
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
