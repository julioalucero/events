class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.references :user, foreign_key: true, index: true
      t.text :metadata

      t.timestamps
    end
  end
end
