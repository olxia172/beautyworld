class AddSubcategoriesToMainCategories < ActiveRecord::Migration[5.1]
  def change
    add_reference :subcategories, :main_category, foreign_key: true
  end
end
