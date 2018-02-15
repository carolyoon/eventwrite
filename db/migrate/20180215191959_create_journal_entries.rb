class CreateJournalEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :journal_entries do |t|
      t.text :content
      t.references :author
      t.references :attendance

      t.timestamps
    end
  end
end
