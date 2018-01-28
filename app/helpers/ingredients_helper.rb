module IngredientsHelper
  def filter_param
    letter_filter_param || function_filter_param
  end
end
