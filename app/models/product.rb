class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :capacity, presence: true

  has_and_belongs_to_many :ingredients
  belongs_to :brand
  belongs_to :subcategory

  attr_reader :ingredient_tokens

  def ingredient_tokens=(ids)
    self.ingredient_ids = ids.split(',') unless ids.empty?
  end
end
