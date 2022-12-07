require 'rails_helper'

RSpec.describe 'Vehicles Delete' do
  describe 'as a user' do
    describe 'when I visit /vehicles/:id' do
      before :each do
        @kendall = Dealership.create!(name: 'Kendall', offers_financing: true, offers_shuttle: false, rating: 3)
        @corolla = @kendall.vehicles.create!(make: 'Toyota', model: 'Corolla', year: 2021, sale_pending: false)
      end
       
      it 'has a link to delete the vehicle' do   
        visit "/vehicles/#{@corolla.id}"

        click_button("Delete Vehicle")

        expect(current_path).to eq('/vehicles')
        expect(page).to_not have_content(@corolla.model)
      end
    end
  end
end
