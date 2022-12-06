class VehiclesController < ApplicationController
  def index
   
    @vehicles = Vehicle.where(sale_pending: :true)
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def new
    @dealership = Dealership.find(params[:id])
  end

  def create
    dealership = Dealership.find(params[:id])
    vehicle = dealership.vehicles.new(vehicle_params)
    
    vehicle.save

    redirect_to "/dealerships/#{dealership.id}/vehicles"
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    vehicle = Vehicle.find(params[:id])
    vehicle.update(vehicle_params)
    
    redirect_to "/vehicles/#{vehicle.id}"
  end

  private
  def vehicle_params
    params.permit(:make, :model, :year, :sale_pending)
  end
end