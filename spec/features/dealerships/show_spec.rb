require 'rails_helper'

RSpec.describe 'Dealerships Show' do
  before :each do
    @kendall = Dealership.create!(name: 'Kendall', offers_financing: true, offers_shuttle: false, rating: 3)
    @lithia = Dealership.create!(name: 'Lithia', offers_financing: false, offers_shuttle: true, rating: 4)
    @power = Dealership.create!(name: 'Power', offers_financing: true, offers_shuttle: true, rating: 5)
  end

  it 'shows individual dealerships by ID number and all of their data' do
    visit "/dealerships/#{@kendall.id}"
    save_and_open_page
    expect(page).to have_content(@kendall.name)
    expect(page).to have_content(@kendall.id)
    expect(page).to have_content(@kendall.offers_financing)
    expect(page).to have_content(@kendall.offers_shuttle)
    expect(page).to have_content(@kendall.rating)
    expect(page).to_not have_content(@lithia.name)
    expect(page).to_not have_content(@power.name)
  end
end