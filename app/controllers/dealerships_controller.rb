class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.date_order
  end

  def show
    @dealership = Dealership.find(params[:id])
  end

  def new
    
  end
  
  def create
    Dealership.create(dealership_params)
    redirect_to '/dealerships'
  end

  private
  def dealership_params
    params.permit(:name, :offers_financing, :offers_shuttle, :rating)
  end
  

  
end