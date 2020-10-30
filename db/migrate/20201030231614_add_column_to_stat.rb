class AddColumnToStat < ActiveRecord::Migration[6.0]
  def change
    add_column :stats, :spotify_track_id, :string
  end
end
