class Item < ApplicationRecord
  belongs_to :category
  belongs_to :restaurant, optional: true
  has_many :orders
end
