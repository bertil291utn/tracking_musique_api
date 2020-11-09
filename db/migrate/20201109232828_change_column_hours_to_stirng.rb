class ChangeColumnHoursToStirng < ActiveRecord::Migration[6.0]
  def change
    change_column :stats, :hours, :string
  end
end
