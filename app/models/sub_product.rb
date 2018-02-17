class SubProduct < ApplicationRecord
  validates :name, presence: true

  belongs_to :product, optional: true
  has_and_belongs_to_many :ingredients

  def ingredient_tokens=(ids)
    self.ingredient_ids = ids.split(',') unless ids.empty?
  end

  def ingredient_tokens
    self.ingredient_ids.join(',')
  end
end
