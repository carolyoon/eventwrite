class JournalEntry < ApplicationRecord
  belongs_to :attendance
  belongs_to :author, class_name: "User"
end
