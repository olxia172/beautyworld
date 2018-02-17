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

  def show_categories(product)
    product.subcategory.main_category.name + " / " + product.subcategory.name
  end

  def author?(product)
    current_user && current_user.id == product.user_id
  end

  def ingredient_functions(ingredient)
    functions = ingredient.ingredient_functions.map { |f| f.name }
    functions.join(', ')
  end

  def how_many_allergens?(product)
    num_of_allergens = 0
    if has_sub_products?(product)
      product.sub_products.each do |sub_product|
        sub_product.ingredients.each do |ingredient|
          num_of_allergens += 1 if ingredient.allergen == true
        end
      end
    else
      product.ingredients.each do |ingredient|
        num_of_allergens += 1 if ingredient.allergen == true
      end
    end
    num_of_allergens
  end

  def has_sub_products?(product)
    !product.sub_products.empty?
  end

  def count_ingredients(product)
    if has_sub_products?(product)
      num_of_ingredients = 0
      product.sub_products.each do |sub_product|
        num_of_ingredients += sub_product.ingredients.count
      end
    else
      num_of_ingredients = product.ingredients.count
    end
    num_of_ingredients
  end
end
