class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.date_order
  end

  def show
    @dealership = Dealership.find(params[:id])
  end
end