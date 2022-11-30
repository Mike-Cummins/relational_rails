class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.all
  end
  def new

  end
  def create
 
    dealership = Dealership.new({
      name: params[:name]
    })

    dealership.save
require 'pry'; binding.pry
    redirect_to '/dealerships'
  end
end