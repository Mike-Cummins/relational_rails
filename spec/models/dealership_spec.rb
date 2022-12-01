require 'rails_helper'

RSpec.describe Dealership do
  it {should have_many :vehicles}
end