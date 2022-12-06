require 'rails_helper'

RSpec.describe Dealership do
  it {should have_many :vehicles}
  describe '#sort_by_alpha' do
    it 'sorts vehicles alphabetically by model' do
      dealership = Dealership.create!(name: 'Kendall', offers_financing: true, offers_shuttle: false, rating: 3)
      tacoma = dealership.vehicles.create!(make: "Toyota", model: 'Tacoma', year: 2021, sale_pending: true)
      supra = dealership.vehicles.create!(make: "Toyota", model: 'Supra', year: 2022, sale_pending: true)
      camry = dealership.vehicles.create!(make: "Toyota", model: 'Camry', year: 2000, sale_pending: true)
      avalon = dealership.vehicles.create!(make: "Toyota", model: 'Avalon', year: 2006, sale_pending: true)
      rav_4 = dealership.vehicles.create!(make: "Toyota", model: 'Rav 4', year: 2000, sale_pending: true)
      
      expect(dealership.sort_by_alpha).to eq([avalon, camry, rav_4, supra, tacoma])
    end
  end
end