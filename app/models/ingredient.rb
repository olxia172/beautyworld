class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_and_belongs_to_many :ingredient_functions
  has_and_belongs_to_many :products

  scope :like_name, -> (name) { where("name ilike ?", "#{name}%") }
end
