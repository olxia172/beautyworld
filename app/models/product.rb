class Product < ApplicationRecord
  validates :name, presence: true
  validates :brand, presence: true
  validates :capacity, presence: true
end
