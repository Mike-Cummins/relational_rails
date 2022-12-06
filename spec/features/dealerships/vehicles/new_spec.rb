require 'rails_helper'

RSpec.describe 'Dealerships Vehicles New' do
  it 'can create new vehicles from the dealerships vehicles page' do
    @kendall = Dealership.create!(name: 'Kendall', offers_financing: true, offers_shuttle: false, rating: 3)
    visit "/dealerships/#{@kendall.id}/vehicles"

    expect(page).to have_content('Create Vehicle')

    click_on('Create Vehicle')

    expect(current_path).to eq("/dealerships/#{@kendall.id}/vehicles/new")
 
    fill_in('Make', with: 'Honda')
    fill_in('Model', with: 'Civic')
    fill_in('Year', with: 2020)
    fill_in('Sale pending', with: false)
    click_on('Create Vehicle')


    expect(current_path).to eq("/dealerships/#{@kendall.id}/vehicles")
    expect(page).to have_content('Civic')
    save_and_open_page
  end
end