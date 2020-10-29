class AddUniqueIndexToArtists < ActiveRecord::Migration[6.0]
  def change
    add_index :artists, [:id_string, :user_id], unique: true
  end
end
