require 'rails_helper'

RSpec.describe 'Dealerships Index' do
  before :each do
    @kendall = Dealership.create!(name: 'Kendall')
    @lithia = Dealership.create!(name: 'Lithia')
    @power = Dealership.create!(name: 'Power')
  end

  it 'displays the name of every dealership' do
    visit "/dealerships"

    expect(page).to have_content(@kendall.name)
  end
end