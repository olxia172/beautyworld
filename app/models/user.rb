class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products
  has_many :opinions, dependent: :destroy

  def user_has_opinion(product)
    product.opinions.where(user_id: id).exists?
  end
end
