class SittingAreasController < ApplicationController
  def show
    @sitting_area = SittingArea.find(params[:id])
    @restaurant = @sitting_area.restaurant
    @pending_orders = @sitting_area.orders.where(status: "en attente")
    @passed_orders = @sitting_area.orders - @pending_orders
  end
end
