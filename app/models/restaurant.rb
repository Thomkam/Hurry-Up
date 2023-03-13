class Restaurant < ApplicationRecord
  has_many :sitting_areas, dependent: :destroy
  has_many :employees, class_name: "User"
  has_many :orders, through: :sitting_areas
  has_many :items
  has_one_attached :image
  has_many :users
end
