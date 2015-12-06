class User < ActiveRecord::Base
  include BCrypt

  validates :name, :username, :email, :password_hash, presence: true
  validates :username, :email, uniqueness: true
  
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
