class JournalEntry < ApplicationRecord
  belongs_to :attendance 
  belongs_to :author, foreign_key :user 
end
