class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_and_belongs_to_many :ingredient_functions
  has_and_belongs_to_many :products
  has_and_belongs_to_many :sub_products

  scope :like_name, -> (name) { where("name ilike ?", "#{name}%") }

  def self.search(search)
    if search
      where("name ilike ?", "%#{search}%")
    else
      all
    end
  end
end
