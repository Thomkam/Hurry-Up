class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def choose_restaurant
    @orders = Order.first(3)
    @restaurants = Restaurant.all
  end

  def assign_restaurant
    @restaurant = Restaurant.find(params[:restaurant].to_i)
    current_user.restaurant = @restaurant
    current_user.status = "employee" # MAJ status employee
    current_user.save
    redirect_to restaurant_path(@restaurant)
  end
end
