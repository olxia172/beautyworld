class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false, unique: true
      t.string :function

      t.timestamps
    end
  end
end
