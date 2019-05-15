class Movie < ApplicationRecord
  validates :title, presence: true
  validates :inventory, presence: true, numericality: true

  has_many :rentals
  has_many :customers, through: :rentals

  def available_inventory
    return self.inventory
  end
end
