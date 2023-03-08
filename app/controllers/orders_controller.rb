class OrdersController < ApplicationController
  def new
    # @item = Item.find(params[:item_id])
    @category = Category.find(params[:category_id])
    @sitting_area = SittingArea.find(params[:sitting_area_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    raise
    @item = Item.find(params[:item_id])
    @order.sitting_area = SittingArea.find(params[:sitting_area_id])
    @order.item = @item
    if @order.save
      redirect_to new_sitting_area_order_path(@sitting_area), notice: 'order was successfully created.'
    else
      render :new
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  def show
    @order = Order.find(params[:id])
    # @sitting_areas = @order.sitting_areas
  end

  private

  def order_params
    params.require(:order).permit(:quantity, :item_id)
  end
end
