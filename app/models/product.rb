class Product < ApplicationRecord
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


  attr_reader :ingredient_tokens

  def ingredient_tokens=(ids)
    self.ingredient_ids = ids.split(',') unless ids.empty?
  end
end
