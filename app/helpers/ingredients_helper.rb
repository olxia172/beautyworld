module IngredientsHelper
  def ingredient_functions(ingredient)
    ingredient_functions = ingredient.ingredient_function_ids.map do |id|
      IngredientFunction.find(id).name
    end
    ingredient_functions.join(', ')
  end
end
