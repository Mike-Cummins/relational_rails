require 'rails_helper'

RSpec.describe 'New Dealership' do
  it 'has a link on the dealership index page to create a new dealership' do
    visit '/dealerships'

    expect(page).to have_content('New Dealership')

    click_on('New Dealership')

    expect(current_path).to eq("/dealerships/new")
  end
end