class FixColumnStatsColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :stats, :id_string, :artist_id
  end
end
