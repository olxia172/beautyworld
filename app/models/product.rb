class Product < ApplicationRecord
  validates :name, presence: true
  validates :brand, presence: true
  validates :capacity, presence: true

  has_and_belongs_to_many :ingredients
  belongs_to :brand

  attr_reader :ingredient_tokens
  attr_reader :brand_tokens

  def ingredient_tokens=(ids)
    self.ingredient_ids = ids.split(',')
  end

  def brand_tokens=(ids)
    self.brand_ids = ids.split(',')
  end
end
