require 'rails_helper'

RSpec.describe Vehicle do
  it {should belong_to :dealership}
  describe '#sort_by_alpha' do
    it 'sorts vehicles alphabetically by model' do
      camry = Vehicle.new(make: "Toyota", model: 'Camry', year: 2000, sale_pending: true)
      
    end
  end
end