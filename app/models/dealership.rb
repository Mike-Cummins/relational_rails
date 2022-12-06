class Dealership < ApplicationRecord
  has_many :vehicles
  def self.date_order
    self.all.order(created_at: :desc)
  end

  def vehicles_count
    vehicles.count
  end

  def sort_by_alpha
    vehicles.order(:model)
  end
end