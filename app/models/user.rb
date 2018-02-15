class User < ApplicationRecord
  has_many :attendances
  has_many :events_attended, through: :attendances
  has_secure_password

  include BCrypt 

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def password
    @password = Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    @user = User.find_by(username: username)
    if @user && @user.password == password
      @user
    else
      nil
    end
  end

end
