class Product < ApplicationRecord
  validates :name, presence: true
  validates :brand, presence: true
  validates :capacity, presence: true

  has_and_belongs_to_many :ingredients
end
