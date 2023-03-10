class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @sitting_area = SittingArea.find(params[:sitting_area_id])
    @item.restaurant = @sitting_area.restaurant
    @item.custom = "true"
    @item.category = Category.find(params[:item][:category].to_i)
    if @item.save
      @order = Order.new(quantity: params[:item][:quantity], item: @item, sitting_area: @sitting_area)
      @order.status = "en attente"
      @order.save
      redirect_to sitting_area_path(@sitting_area), notice: "#{@item.name} a été envoyée 😎."
    else
      render 'sitting_areas/show'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
