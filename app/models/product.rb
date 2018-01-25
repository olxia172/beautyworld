class Product < ApplicationRecord
  validates :name, presence: true
  validates :brand, presence: true
  validates :capacity, presence: true

  has_and_belongs_to_many :ingredients

  attr_reader :ingredient_tokens

  def ingredient_tokens=(ids)
    self.ingredient_ids = ids.split(',')
  end
end
