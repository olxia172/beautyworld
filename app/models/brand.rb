class Brand < ApplicationRecord
  include Searchable

  mapping dynamic: false do
    indexes :name, type: :text, analyzer: :english
  end

  mount_uploader :logo, LogoUploader
  validates :name, presence: true, uniqueness: true
  validates :description, length: { in: 20..5000 }

  has_many :products
end
