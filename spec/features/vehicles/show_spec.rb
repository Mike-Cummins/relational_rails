require 'rails_helper'

RSpec.describe 'Vehicles Show' do
  describe 'as a user' do
    describe 'when I visit /vehicles/:id' do
      before :each do
        @kendall = Dealership.create!(name: 'Kendall', offers_financing: true, offers_shuttle: false, rating: 3)
        @corolla = @kendall.vehicles.create!(make: 'Toyota', model: 'Corolla', year: 2021, sale_pending: false)
        @camry = @kendall.vehicles.create!(make: 'Toyota', model: 'Camry', year: 2022, sale_pending: false)
      end
       
      it 'shows individual vehicle by ID and all of their data' do
        visit "/vehicles/#{@camry.id}"

        expect(page).to have_content(@camry.make)
        expect(page).to have_content(@camry.model)
        expect(page).to have_content(@camry.year)
        expect(page).to_not have_content(@corolla.model)
      end

      it 'has a link to /vehicles' do 
        visit "/vehicles/#{@camry.id}"

        expect(page).to have_content('All Dealerships')

        click_on('All Dealerships')

        expect(current_path).to eq('/dealerships')
      end
    end
  end
end