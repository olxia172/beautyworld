class AddReferenceSubProductProduct < ActiveRecord::Migration[5.1]
  def change
    add_reference :sub_products, :product, foreign_key: true
  end
end
