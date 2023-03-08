class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def choose_restaurant
    @orders = Order.first(3)
    @restaurants = Restaurant.all
  end
end
