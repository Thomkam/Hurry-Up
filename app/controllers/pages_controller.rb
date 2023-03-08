class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @orders = Order.first(3)
  end

  def choose_restaurant
  end
end
