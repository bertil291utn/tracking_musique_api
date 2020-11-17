class ChangeColumnHoursToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :stats, :hours, :integer
  end
end
