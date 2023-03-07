class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to items_path, notice: 'item was successfully created 😎.'
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :custom)
  end
end
