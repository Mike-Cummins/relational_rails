require 'rails_helper'

RSpec.describe 'Dealerships Vehicles Index' do
  describe 'as a user' do
    describe 'when I visit /dealships/:id/vehicles' do
      before :each do
        @kendall = Dealership.create!(name: 'Kendall', offers_financing: true, offers_shuttle: false, rating: 3)
        @supra = @kendall.vehicles.create!(make: 'Toyota', model: 'Supra', year: 2022, sale_pending: false)
        @corolla = @kendall.vehicles.create!(make: 'Toyota', model: 'Corolla', year: 2021, sale_pending: false)
        @camry = @kendall.vehicles.create!(make: 'Toyota', model: 'Camry', year: 2022, sale_pending: false)
        @lithia = Dealership.create!(name: 'Lithia', offers_financing: true, offers_shuttle: true, rating: 4)
        @wrangler = @lithia.vehicles.create!(make: 'Jeep', model: 'Wrangler', year: 2018, sale_pending: true)
      end

      it 'has a link to /dealerships' do 
        visit "/dealerships/#{@kendall.id}/vehicles"

        expect(page).to have_content('All Dealerships')

        click_on('All Dealerships')

        expect(current_path).to eq('/dealerships')
      end

      it 'has a link to /vehicles' do 
        visit "/dealerships/#{@kendall.id}/vehicles"

        expect(page).to have_content('All Vehicles')

        click_on('All Vehicles')

        expect(current_path).to eq('/vehicles')
      end

      it 'has a link to sort by alpha order' do 
        visit "/dealerships/#{@kendall.id}/vehicles"

        expect(page).to have_content('Sort')

        click_on('Sort')

        expect(@camry.model).to appear_before(@coroll.model)
        expect(@corolla.model).to appear_before(@supra.model)
        expect(current_path).to eq("/dealerships/#{@kendall.id}/vehicles")
      end
    end
  end
end