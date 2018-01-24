class CreateIngredientIngredientFuntionJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :ingredients, :ingredient_functions
  end
end
