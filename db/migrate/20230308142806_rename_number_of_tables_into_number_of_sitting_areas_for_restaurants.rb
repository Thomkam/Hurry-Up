class RenameNumberOfTablesIntoNumberOfSittingAreasForRestaurants < ActiveRecord::Migration[7.0]
  def change
    rename_column :restaurants, :number_of_tables, :number_of_sitting_areas
  end
end
