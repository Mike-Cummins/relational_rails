require 'rails_helper'

RSpec.describe 'Dealerships Update' do
  it 'has a link on dealer show page to update dealer' do
    @kendall = Dealership.create!(name: 'Kendall', offers_financing: true, offers_shuttle: false, rating: 3)
    visit "/dealerships/#{@kendall.id}"

    expect(page).to have_content("Update Dealership")

    click_on("Update Dealership")
    
    expect(current_path).to eq("/dealerships/#{@kendall.id}/edit")

    fill_in('Name', with: 'Kendall Honda')
    fill_in('Financing', with: true)
    fill_in('Shuttle', with: true)
    fill_in('Rating', with: 5)
    click_on('Update Dealership')

    expect(current_path).to eq("/dealerships/#{@kendall.id}")
    expect(page).to have_content('Kendall Honda')
  end
end