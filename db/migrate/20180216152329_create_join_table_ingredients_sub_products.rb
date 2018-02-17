class CreateJoinTableIngredientsSubProducts < ActiveRecord::Migration[5.1]
  def change
    create_join_table :ingredients, :sub_products
  end
end
