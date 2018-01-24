# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

ingredients_path = Rails.root.join("tmp/ingredients.csv")
CSV.foreach(ingredients_path) do |row|
  ingredient = Ingredient.find_or_create_by!(name: row[1])
  functions = row[2].split(',').map { |elem| elem.strip }
  functions.each do |f|
    ingredient_function = IngredientFunction.find_or_create_by!(name: f)
    ingredient.ingredient_functions << ingredient_function
  end
  ingredient.save
  binding.pry
end
