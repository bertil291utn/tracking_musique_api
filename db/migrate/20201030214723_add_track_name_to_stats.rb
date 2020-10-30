class AddTrackNameToStats < ActiveRecord::Migration[6.0]
  def change
    add_column :stats, :track_name, :string
  end
end
