class AddDescriptionToIngredientFunctions < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredient_functions, :description, :text
  end
end
