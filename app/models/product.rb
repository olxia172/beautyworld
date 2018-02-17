class Product < ApplicationRecord
  include Searchable

  mapping dynamic: false do
    indexes :name, type: :text, analyzer: :english
  end

  mount_uploader :image, ImageUploader

  validates :name, presence: true, uniqueness: true
  validates :capacity, presence: true
  validates :image, presence: true
  validates :subcategory_id, presence: true
  # validates :ingredient_tokens, presence: true

  has_and_belongs_to_many :ingredients
  belongs_to :brand
  belongs_to :subcategory
  belongs_to :user
  has_many :opinions, dependent: :destroy

  has_many :sub_products, dependent: :destroy
  accepts_nested_attributes_for :sub_products, :reject_if => lambda { |a| a[:name].blank? }, allow_destroy: true

  def ingredient_tokens=(ids)
    self.ingredient_ids = ids.split(',') unless ids.empty?
  end

  def ingredient_tokens
    self.ingredient_ids.join(',')
  end
end
