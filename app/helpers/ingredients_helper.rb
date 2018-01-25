module IngredientsHelper
  def sort_param
    letter_sort_param || function_sort_param
  end

  def ingredient_functions(ingredient)
    ingredient_functions = ingredient.ingredient_function_ids.map do |id|
      IngredientFunction.find(id).name
    end
    ingredient_functions.join(', ')
  end
end
