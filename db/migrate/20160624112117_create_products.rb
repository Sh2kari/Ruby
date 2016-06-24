class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.integer :price
      t.integer :weekday_id

      t.timestamps null: false
    end

    add_index :products, :weekday_id
  end
end
