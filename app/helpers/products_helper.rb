module ProductsHelper
  def product_ingredients(product)
    product_ingredients = product.ingredient_ids.map do |id|
      Ingredient.find(id).name
    end
    product_ingredients.join(', ')
  end
end
