class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @sitting_areas = @restaurant.sitting_areas
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.number_of_sitting_areas.times do |index|
      @restaurant.sitting_areas.new(sitting_area_number: index + 1)
    end
    if @restaurant.save
      @restaurant.users << current_user
      current_user.update(status: "owner") # ajout du status
      redirect_to restaurant_path(@restaurant), notice: 'restaurant was successfully created 😎.'
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
    params.require(:restaurant).permit(:name, :address, :image, :number_of_sitting_areas)
  end
end
