class AddColumnToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :name, :string
    add_column :artists, :photoUrl, :string
  end
end
