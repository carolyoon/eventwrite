class Event < ApplicationRecord
  has_many :attendances
  has_many :attendees, through: :attendances
end

