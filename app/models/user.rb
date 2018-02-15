class User < ApplicationRecord
  has_many :attendances
  has_many :events_attended, through: :attendances, source: :event
  
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true

end
