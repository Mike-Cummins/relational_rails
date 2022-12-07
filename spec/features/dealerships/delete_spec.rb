require 'rails_helper'

RSpec.describe 'Dealership Delete' do
  describe 'as a user' do
    describe 'when I visit /dealerships/:id' do
      it 'has a link to delete that parent' do
        kendall = Dealership.create!(name: 'Kendall', offers_financing: true, offers_shuttle: false, rating: 3)
        corolla = kendall.vehicles.create!(make: 'Toyota', model: 'Corolla', year: 2021, sale_pending: false)
        camry = kendall.vehicles.create!(make: 'Toyota', model: 'Camry', year: 2022, sale_pending: false)
        lithia = Dealership.create!(name: 'Lithia', offers_financing: false, offers_shuttle: true, rating: 4)
        visit "/dealerships/#{kendall.id}" 
        
        click_button("Delete Dealership")
        
        expect(current_path).to eq('/dealerships')
        expect(page).to have_content(lithia.name)
        expect(page).to_not have_content(kendall.name)
      end
    end
  end
end