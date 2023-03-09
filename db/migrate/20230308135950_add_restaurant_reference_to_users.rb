class AddRestaurantReferenceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :restaurant, foreign_key: false
  end
end
