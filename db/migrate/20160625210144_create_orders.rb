class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :weekday_id

      t.timestamps null: false
    end

    add_index :orders, :weekday_id
  end
end
