class AddColumnToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :employee, :integer
  end
end
