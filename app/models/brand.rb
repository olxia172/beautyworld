class Brand < ApplicationRecord
  include Searchable

  mapping dynamic: false do
    indexes :name, type: :text, analyzer: :english
  end

  mount_uploader :logo, LogoUploader
  validates :name, presence: true, uniqueness: true
  validates :description, length: { in: 20..5000 }

  has_many :products

  def self.popular
    brand_ids = Product.group(:brand_id).pluck(:brand_id)
    Brand.find(brand_ids)
  end
end
