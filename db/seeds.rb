# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'csv'
#
# ingredients_path = Rails.root.join("tmp/ingredients.csv")
# CSV.foreach(ingredients_path) do |row|
#   ingredient = Ingredient.find_or_create_by!(name: row[1])
#
#   if !row[2].nil?
#     functions = row[2].split(',').map { |elem| elem.strip }
#   else
#     functions = ["UNKNOWN"]
#   end
#
#   functions.each do |f|
#     ingredient_function = IngredientFunction.find_or_create_by!(name: f)
#     ingredient.ingredient_functions << ingredient_function unless ingredient.ingredient_functions.include?(ingredient_function)
#   end
# end

# ingredients_path = Rails.root.join("tmp/cosing_colorants.csv")
# CSV.foreach(ingredients_path) do |row|
#   ingredient = Ingredient.where("name ilike ?", "#{row.join[0..7]}%").first
#   if ingredient
#     ingredient.name = row.join
#     ingredient.save
#   else
#     new_ingredient = Ingredient.create!(name: row.join)
#     new_ingredient.ingredient_functions << IngredientFunction.where("name ilike ?", "%colo%")
#   end
# end
