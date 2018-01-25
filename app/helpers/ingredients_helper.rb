module IngredientsHelper
  def sort_param
    letter_sort_param || function_sort_param
  end
end
