class Subcategory < ApplicationRecord
  belongs_to :main_category
  has_many :products
end
