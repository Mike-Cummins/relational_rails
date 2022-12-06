require 'rails_helper'

RSpec.describe 'Vehicles Index' do
  describe 'as a user' do
    describe 'when I visit /vehicles' do
      it 'shows all vehicles with true boolean values' do
        @kendall = Dealership.create!(name: 'Kendall', offers_financing: true, offers_shuttle: false, rating: 3)
        @corolla = @kendall.vehicles.create!(make: 'Toyota', model: 'Corolla', year: 2021, sale_pending: true)
        @camry = @kendall.vehicles.create!(make: 'Toyota', model: 'Camry', year: 2022, sale_pending: true)
        @highlander = @kendall.vehicles.create!(make: 'Toyota', model: 'Highlander', year: 2021, sale_pending: true) 
        @supra = @kendall.vehicles.create!(make: 'Toyota', model: 'Supra', year: 2022, sale_pending: true)
        @runner = @kendall.vehicles.create!(make: 'Toyota', model: '4 Runner TRD Pro', year: 2022, sale_pending: false)
        visit '/vehicles'
      
        expect(page).to have_content(@corolla.make)
        expect(page).to have_content(@corolla.model)
        expect(page).to have_content(@corolla.year)
        expect(page).to have_content(@corolla.sale_pending)
        expect(page).to have_content(@camry.model)
        expect(page).to have_content(@highlander.model)
        expect(page).to have_content(@supra.model)
        expect(page).to_not have_content(@runner.model)
      end

      it 'has a link to /dealerships' do 
        visit "/vehicles"

        expect(page).to have_content('All Dealerships')

        click_on('All Dealerships')

        expect(current_path).to eq('/dealerships')
      end

      it 'has a link to /vehicles' do 
        visit "/vehicles"

        expect(page).to have_content('All Vehicles')

        click_on('All Vehicles')

        expect(current_path).to eq('/vehicles')
      end
    end
  end
end