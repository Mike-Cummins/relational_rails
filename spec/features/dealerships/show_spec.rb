require 'rails_helper'

RSpec.describe 'Dealerships Show' do
  before :each do
    @kendall = Dealership.create!(name: 'Kendall', offers_financing: true, offers_shuttle: false, rating: 3)
    @lithia = Dealership.create!(name: 'Lithia', offers_financing: false, offers_shuttle: true, rating: 4)
    @power = Dealership.create!(name: 'Power', offers_financing: true, offers_shuttle: true, rating: 5)
    @corolla = @kendall.vehicles.create!(make: 'Toyota', model: 'Corolla', year: 2021, sale_pending: false)
    @camry = @kendall.vehicles.create!(make: 'Toyota', model: 'Camry', year: 2022, sale_pending: false)
  end

  it 'shows individual dealerships by ID number and all of their data' do
    visit "/dealerships/#{@kendall.id}"

    expect(page).to have_content(@kendall.name)
    expect(page).to have_content(@kendall.id)
    expect(page).to have_content(@kendall.offers_financing)
    expect(page).to have_content(@kendall.offers_shuttle)
    expect(page).to have_content(@kendall.rating)
    expect(page).to_not have_content(@lithia.name)
    expect(page).to_not have_content(@power.name)
  end

  it 'displays the total number of vehicles in inventory' do
    visit "/dealerships/#{@kendall.id}"

    expect(page).to have_content("Total Inventory: 2")
  end

  it 'has a link to /vehicles' do 
    visit "/dealerships/#{@kendall.id}"

    expect(page).to have_content('All Dealerships')

    click_on('All Dealerships')

    expect(current_path).to eq('/dealerships')
  end
end