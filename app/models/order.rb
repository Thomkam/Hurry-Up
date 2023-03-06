class Order < ApplicationRecord
  belongs_to :item
  belongs_to :sitting_area
end
