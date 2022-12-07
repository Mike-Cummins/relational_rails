require 'rails_helper'

RSpec.describe 'Vehicle Delete' do
  it 'has a link to delete vehicle from its show page' do
    kendall = Dealership.create!(name: 'Kendall', offers_financing: true, offers_shuttle: false, rating: 3)
    corolla = kendall.vehicles.create!(make: 'Toyota', model: 'Corolla', year: 2021, sale_pending: false)
    camry = kendall.vehicles.create!(make: 'Toyota', model: 'Camry', year: 2022, sale_pending: false)
    visit "/vehicles/#{corolla.id}"

    click_button("Delete Vehicle")

    expect(current_path).to eq('/vehicles')
    expect(page).to_not  have_content(corolla.model)
    expect(page).to have_content(camry.model)
  end
end
