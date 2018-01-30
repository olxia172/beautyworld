class Brand < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, length: { in: 20..500 }

  has_many :products
end
