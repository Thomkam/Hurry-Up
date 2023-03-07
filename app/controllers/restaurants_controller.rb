class RestaurantsController < ApplicationController
  def show
    @sitting_area = Sitting_area.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to restaurants_path, notice: 'restaurant was successfully created 😎.'
    else
      render :new
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'restaurant was successfully updated 😎.'
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_url, notice: 'restaurant was successfully destroyed 😎.'
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :image, :number_of_tables)
  end
end
