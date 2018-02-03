class AddAllegrenToIngredient < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :allergen, :boolean, default: false
  end
end
