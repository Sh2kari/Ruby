class CreateWeekdays < ActiveRecord::Migration
  def change
    create_table :weekdays do |t|
      t.string :title
      t.string :cover

      t.timestamps null: false
    end
  end
end
