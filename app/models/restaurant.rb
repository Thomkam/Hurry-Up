class Restaurant < ApplicationRecord
  has_many :sitting_areas
  has_many :employees, class_name: :users
  has_many :orders, through: :sitting_areas
  has_many :items
  has_one_attached :photo
end
