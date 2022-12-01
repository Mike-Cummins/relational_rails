class DealershipVehiclesController < ApplicationController
  def index
    @dealership = Dealership.find(params[:id])
    @vehicles = @dealership.vehicles
  end
end