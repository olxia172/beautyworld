class CreateJoinTableIngredientsProducts < ActiveRecord::Migration[5.1]
  def change
    create_join_table :ingredients, :products
  end
end
