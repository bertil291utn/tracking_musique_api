class ChangeColumnHoursToStats < ActiveRecord::Migration[6.0]
  def change
    change_column :stats, :hours, :decimal
  end
end
