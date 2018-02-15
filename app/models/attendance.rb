class Attendance < ApplicationRecord
  belongs_to :events
  belongs_to :user 
end
