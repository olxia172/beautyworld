class Opinion < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { in: 10..500 }
  validates :rate, presence: true, inclusion: { in: 1..5 }
  validates :hit, inclusion: { in: [true, false] }
  validates :buy_again, inclusion: { in: [true, false] }
  validates :user_id, uniqueness: true

  belongs_to :user
  belongs_to :product
end
