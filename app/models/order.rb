require 'dotiw'

class Order < ApplicationRecord
  belongs_to :item
  belongs_to :sitting_area
  has_one :restaurant, through: :sitting_area
  has_one :category, through: :item

  include ActionView::Helpers::DateHelper

  def find_time
    distance_of_time_in_words(Time.now, created_at)
  end
end
