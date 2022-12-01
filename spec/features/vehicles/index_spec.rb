require 'rails_helper'

RSpec.describe 'Vehicles Index' do
  describe 'as a user' do
    describe 'when I visit /vehicles' do
      it 'shows all vehicles' do
        @kendall = Dealership.create!(name: 'Kendall', offers_financing: true, offers_shuttle: false, rating: 3)
        @corolla = @kendall.vehicles.create!(make: 'Toyota', model: 'Corolla', year: 2021, sale_pending: false)
        @camry = @kendall.vehicles.create!(make: 'Toyota', model: 'Camry', year: 2022, sale_pending: false)
        @highlander = @kendall.vehicles.create!(make: 'Toyota', model: 'Highlander', year: 2021, sale_pending: false) 
        @supra = @kendall.vehicles.create!(make: 'Toyota', model: 'Supra', year: 2022, sale_pending: true)  
        visit '/vehicles'
        save_and_open_page
        expect(page).to have_content(@corolla.make)
        expect(page).to have_content(@corolla.model)
        expect(page).to have_content(@corolla.year)
        expect(page).to have_content(@corolla.sale_pending)
        expect(page).to have_content(@camry.model)
        expect(page).to have_content(@highlander.model)
        expect(page).to have_content(@supra.model)
      end
    end
  end
end