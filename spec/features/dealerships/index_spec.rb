require 'rails_helper'

RSpec.describe 'Dealerships Index' do
  before :each do
    @kendall = Dealership.create!(name: 'Kendall', offers_financing: true, offers_shuttle: false, rating: 3, created_at: Time.now - 2.days)
    @lithia = Dealership.create!(name: 'Lithia', offers_financing: false, offers_shuttle: true, rating: 4)
    @power = Dealership.create!(name: 'Power', offers_financing: true, offers_shuttle: true, rating: 5, created_at: Time.now - 4.days)   
  end

  it 'displays the name of every dealership' do
    visit "/dealerships"

    expect(page).to have_content(@kendall.name)
    expect(page).to have_content(@lithia.name)
    expect(page).to have_content(@power.name)
  end

  it 'sorts dealerships by most recent created_at date' do
    visit "/dealerships"
    
    expect(@lithia.name).to appear_before(@kendall.name)
    expect(@kendall.name).to appear_before(@power.name)
  end
end