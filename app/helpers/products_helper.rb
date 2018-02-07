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

  def show_categories(product)
    product.subcategory.main_category.name + " / " + product.subcategory.name
  end

  def ingredient_functions(ingredient)
    functions = ingredient.ingredient_functions.map { |f| f.name }
    functions.join(', ')
  end

  def how_many_allergens?(product)
    num_of_allergens = 0
    product.ingredients.each do |ingredient|
      num_of_allergens += 1 if ingredient.allergen == true
    end
    num_of_allergens
  end
end
