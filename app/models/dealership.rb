class Dealership < ApplicationRecord
  has_many :vehicles
  def self.date_order
    self.all.order(:created_at).reverse
  end
end