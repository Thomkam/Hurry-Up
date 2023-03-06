class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :quantity
      t.references :item, null: false, foreign_key: true
      t.references :sitting_area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
