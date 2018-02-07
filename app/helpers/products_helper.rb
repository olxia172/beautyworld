module ProductsHelper
  def product_ingredients(product)
    product_ingredients = product.ingredient_ids.map do |id|
      Ingredient.find(id).name
    end
    product_ingredients.join(', ')
  end

  def show_author(product)
    author = User.where(id: product.user_id).first
    author.email
  end

  def author?(product)
    current_user && current_user.id == product.user_id
  end
end
