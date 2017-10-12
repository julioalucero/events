class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.date :date, null: false
      t.integer :start_at
      t.integer :end_at
      t.references :location, index: true
      t.text :topics

      t.timestamps
    end
  end
end
