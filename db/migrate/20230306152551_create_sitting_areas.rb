class CreateSittingAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :sitting_areas do |t|
      t.integer :table_number
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
