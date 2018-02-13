class Product < ApplicationRecord
  include Searchable

  mapping dynamic: false do
    indexes :name, type: :text, analyzer: :english
  end

  # id: integer, name: string, capacity: string, created_at: datetime, updated_at: datetime, brand_id: integer, subcategory_id: integer, image: string, description: text, user_id: integer
  mount_uploader :image, ImageUploader

  validates :name, presence: true, uniqueness: true
  validates :capacity, presence: true
  validates :image, presence: true
  validates :subcategory_id, presence: true
  validates :ingredient_tokens, presence: true

  has_and_belongs_to_many :ingredients
  belongs_to :brand
  belongs_to :subcategory
  belongs_to :user
  has_many :opinions, dependent: :destroy

  def ingredient_tokens=(ids)
    self.ingredient_ids = ids.split(',') unless ids.empty?
  end

  def ingredient_tokens
    self.ingredient_ids.join(',')
  end
end
