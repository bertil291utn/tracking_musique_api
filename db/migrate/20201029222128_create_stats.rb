class CreateStats < ActiveRecord::Migration[6.0]
  def change
    create_table :stats do |t|
      t.integer :hours
      t.string :day
      t.belongs_to :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
