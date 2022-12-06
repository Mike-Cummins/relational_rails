require 'rails_helper'

RSpec.describe 'New Dealership' do
  it 'has a link on the dealership index page to create a new dealership' do 
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