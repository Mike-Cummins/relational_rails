require 'rails_helper'

RSpec.describe 'Vehicles Update' do
  it 'has a link on vehicles show page to update vehicle' do
    @kendall = Dealership.create!(name: 'Kendall', offers_financing: true, offers_shuttle: false, rating: 3)
    @corolla = @kendall.vehicles.create!(make: 'Toyota', model: 'Corolla', year: 2021, sale_pending: false)
    visit "/vehicles/#{@corolla.id}"
    
    expect(page).to have_content('Update Vehicle')

    click_on('Update Vehicle')

    expect(current_path).to eq("/vehicles/#{@corolla.id}/edit")

    fill_in('Make', with: 'Honda')
    fill_in('Model', with: 'Civic')
    fill_in('Year', with: 2020)
    fill_in('Sale pending', with: false)
    click_on('Update Vehicle')

    expect(current_path).to eq("/vehicles/#{@corolla.id}")
    expect(page).to have_content('Civic')
    expect(page).to_not have_content('Corolla')
  end
end