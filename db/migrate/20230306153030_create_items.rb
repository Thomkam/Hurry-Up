class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :custom
      t.references :category, null: false, foreign_key: true
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
