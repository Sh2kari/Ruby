class AddDateToWeekdays < ActiveRecord::Migration
  def change
    add_column :weekdays, :date, :string
  end
end
