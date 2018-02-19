module IngredientsHelper
  def filter_param
    letter_filter_param || function_filter_param
  end

  def allergen?(ingredient)
    ingredient.allergen == true
  end

  def show_ingredient_functions(ingredient)
    ingredient.ingredient_functions.map { |function| function.name }.join(', ')
  end
end
