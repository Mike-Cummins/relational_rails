require 'rails_helper'

RSpec.describe 'Vehicles Show' do
  describe 'as a user' do
    describe 'when I visit /vehicles/:id' do
      it 'shows individual vehicle by ID and all of their data' do
        kendall = Dealership.create!(name: 'Kendall', offers_financing: true, offers_shuttle: false, rating: 3)
        corolla = kendall.vehicles.create!(make: 'Toyota', model: 'Corolla', year: 2021, sale_pending: false)
        camry = kendall.vehicles.create!(make: 'Toyota', model: 'Camry', year: 2022, sale_pending: false)
        visit "/vehicles/#{camry.id}"

        expect(page).to have_content(camry.make)
        expect(page).to have_content(camry.model)
        expect(page).to have_content(camry.year)
        expect(page).to_not have_content(corolla.model)
      end
    end
  end
end