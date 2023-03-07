class SittingAreasController < ApplicationController
  def show
    @sitting_area = SittingArea.find(params[:id])
  end
end
