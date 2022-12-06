require 'rails_helper'

RSpec.describe 'New Dealership' do
  it 'has a link on the dealership index page to create a new dealership' do
    @kendall = Dealership.create!(name: 'Kendall', offers_financing: true, offers_shuttle: false, rating: 3, created_at: Time.now - 2.days)
    @lithia = Dealership.create!(name: 'Lithia', offers_financing: false, offers_shuttle: true, rating: 4)
    @power = Dealership.create!(name: 'Power', offers_financing: true, offers_shuttle: true, rating: 5, created_at: Time.now - 4.days)   
    visit '/dealerships'

    expect(page).to have_content('New Dealership')

    click_on('New Dealership')

    expect(current_path).to eq('/dealerships/new')

    fill_in('Name', with: 'Tonkin Honda')
    fill_in('Financing', with: true)
    fill_in('Shuttle', with: true)
    fill_in('Rating', with: 5)
    click_on('Create Dealership')

    expect(current_path).to eq('/dealerships')
    expect(page).to have_content('Tonkin Honda')
  end
end