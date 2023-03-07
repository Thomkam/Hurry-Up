class OrdersController < ApplicationController
  def new
    # @item = Item.find(params[:item_id])
    @category = Category.find(params[:category_id])
    @sitting_area = SittingArea.find(params[:sitting_area_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @item = Item.find(params[:item_id])
    @order.user = current_user
    @order.item = @item
    if @order.save
      redirect_to "#", notice: 'order was successfully created.'
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
end
