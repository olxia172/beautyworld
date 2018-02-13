class Opinion < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { in: 20..500 }
  validates :rate, inclusion: { in: 1..5 }

  belongs_to :user
  belongs_to :product
end
