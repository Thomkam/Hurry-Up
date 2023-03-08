class RenameTableNumberIntoSittingAreaNumberForSittingAreas < ActiveRecord::Migration[7.0]
  def change
    rename_column :sitting_areas, :table_number, :sitting_area_number
  end
end
