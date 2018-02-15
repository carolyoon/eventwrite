class CreateJournalEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :journal_entries do |t|
      t.text :content
      t.integer :rating
      t.references :author
      t.references :event

      t.timestamps
    end
  end
end
