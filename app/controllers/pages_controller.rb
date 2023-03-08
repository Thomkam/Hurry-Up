class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @orders = Order.first(3)
    @restaurants = Restaurant.all
  end

  def choose_restaurant
  end
end
