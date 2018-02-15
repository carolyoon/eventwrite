class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.string :image_url
      t.string :event_url

      t.timestamps
    end
  end
end
