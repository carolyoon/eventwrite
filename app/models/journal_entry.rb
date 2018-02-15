class JournalEntry < ApplicationRecord
  belongs_to jiattendance 
  belongs_to :author, class_name: "User"
end
indexo