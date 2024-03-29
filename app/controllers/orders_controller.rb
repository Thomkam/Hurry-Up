class OrdersController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @sitting_area = SittingArea.find(params[:sitting_area_id])
    @order = Order.new
    @pending_orders = @sitting_area.orders.where(status: "en attente")
    @passed_orders = @sitting_area.orders - @pending_orders
    @restaurant = @sitting_area.restaurant
  end

  def add_order
    @order = Order.find_by(item_id: params[:item_id].to_i, sitting_area_id: params[:sitting_area_id].to_i, status: "en attente")
    if @order.nil?
      @order = Order.new(status: "en attente", quantity: 1)
      @order.item = Item.find(params[:item_id])
      @order.sitting_area = SittingArea.find(params[:sitting_area_id])
      if @order.save
        redirect_to new_sitting_area_order_path(@order.sitting_area, Order.new, category_id: @order.item.category.id)
      else
        render :new
      end
    else
      @order.quantity += 1
      @order.save
      redirect_to new_sitting_area_order_path(@order.sitting_area, Order.new, category_id: @order.item.category.id)
    end
  end

  def remove_order
    @order = Order.find_by(item_id: params[:item_id].to_i, sitting_area_id: params[:sitting_area_id].to_i, status: "en attente") # Find order
    if @order.quantity > 1
      @order.quantity -= 1 # decrement quantity
      @order.save # save
      redirect_to new_sitting_area_order_path(@order.sitting_area, Order.new, category_id: @order.item.category.id) # redirect av le submit
    else
      @order.destroy
      redirect_to new_sitting_area_order_path(@order.sitting_area, Order.new, category_id: @order.item.category.id) # redirect av le submit
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.status = params[:order][:status]
    @order.employee = current_user.id
    @order.save
    redirect_to restaurant_path(@order.sitting_area.restaurant), status: :unprocessable_entity
  end

  def destroy
    @order = Order.find(params[:id])
    @sitting_area = @order.sitting_area
    @order.destroy
    redirect_to new_sitting_area_order_path(@sitting_area, Order.new)
  end

  def show
    @order = Order.find(params[:id])
    # @sitting_areas = @order.sitting_areas
  end

  def update_all
    status = params[:sitting_area][:status]
    @sitting_area = SittingArea.find(params[:sitting_area][:sitting_area].to_i)
    @sitting_area.orders.where(status: "en attente").update_all(status: status, employee: current_user.id)
    redirect_to restaurant_path(@sitting_area.restaurant), status: :unprocessable_entity
  end

  private

  def order_params
    params.require(:order).permit(:quantity, :item_id)
  end
end
