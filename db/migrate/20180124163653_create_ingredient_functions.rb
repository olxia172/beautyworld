class CreateIngredientFunctions < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredient_functions do |t|
      t.string :name

      t.timestamps
    end
  end
end
