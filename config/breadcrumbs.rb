crumb :root do
  link "Home", root_path
end

crumb :all_products do
  link "All products", products_path
end

crumb :all_categories do
  link "Categories", subcategories_path
end

crumb :new_subcategory do
  link 'New'
  parent :all_categories
end

crumb :main_category do |subcategory|
  link subcategory.main_category.name, subcategories_path
  parent :all_categories
end

crumb :subcategory_products do |subcategory|
  link subcategory.name, subcategory_path(subcategory)
  parent :main_category, subcategory
end

crumb :brands do
  link "Brands", brands_path
end

crumb :brand do |brand|
  link brand.name, brand_path(brand)
  parent :brands
end

crumb :brand_products do |brand|
  link "Products", brand_products_path(brand)
  parent :brand, brand
end

crumb :product do |product|
  if params[:subcategory_id]
    link product.name, subcategory_product_path(product)
    parent :subcategory_products, product.subcategory
  elsif params[:brand_id]
    link product.name, brand_product_path(product)
    parent :brand_products, product.brand
  else
    link product.name, product_path(product)
    parent :all_products
  end
end

crumb :edit_product do |product|
  link "Edit"
  parent :product, product
end

crumb :new_product do |product|
  link "New"
  if params[:subcategory_id]
    parent :subcategory_products, product.subcategory
  elsif params[:brand_id]
    parent :brand_products, product.brand
  else
    parent :all_products
  end
end

crumb :all_ingredients do
  link "Ingredients", ingredients_path
end

crumb :new_ingredient do
  link 'New'
  parent :all_ingredients
end

crumb :ingredient do |ingredient|
  link ingredient.name, ingredient_path(ingredient)
  parent :all_ingredients
end

crumb :edit_ingredient do
  link 'Edit'
  parent :ingredient
end

crumb :edit_brand do |brand|
  link "Edit", edit_brand_path(brand)
  parent :brand, brand
end

crumb :new_brand do
  link "New", brands_path
  parent :brands
end

crumb :search do |keyword|
  link "Searching for '#{keyword}'"
end

crumb :search_for_ingredient do |keyword|
  link "Searching for '#{keyword}'"
  parent :all_ingredients
end

crumb :search_for_brand do |keyword|
  link "Searching for '#{keyword}'"
  parent :brands
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
