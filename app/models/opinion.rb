class Opinion < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { in: 20..500 }

  belongs_to :user
  belongs_to :product
end
