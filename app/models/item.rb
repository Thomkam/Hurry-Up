require 'active_support'

class Item < ApplicationRecord
  belongs_to :category
  belongs_to :restaurant, optional: true
  has_many :orders

  def plural_name
    name.pluralize
  end
end
