class DealershipVehiclesController < ApplicationController
  def index
    @dealership = Dealership.find(params[:id])
    if params[:sort_by_alpha]
      @vehicles = @dealership.sort_by_alpha
    else
      @vehicles = @dealership.vehicles
    end
  end
end