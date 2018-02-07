class AddProductIdUserIdToOpinion < ActiveRecord::Migration[5.1]
  def change
    add_reference :opinions, :user, foreign_key: true
    add_reference :opinions, :product, foreign_key: true
  end
end
