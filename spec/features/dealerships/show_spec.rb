require 'rails_helper'

RSpec.describe 'Dealerships Show' do
  before :each do
    @kendall = Dealership.create!(name: 'Kendall')
    @lithia = Dealership.create!(name: 'Lithia')
    @power = Dealership.create!(name: 'Power')
  end

  it 'shows individual dealerships by ID number and all of their data' do
    visit "/dealerships/#{@kendall.id}"

    expect(page).to have_content(@kendall.name)
    expect(page).to have_content(@kendall.name)
  end