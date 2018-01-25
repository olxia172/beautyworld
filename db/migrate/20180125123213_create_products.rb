class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false, unique: true
      t.string :brand, null: false
      t.string :capacity, null: false

      t.timestamps
    end
  end
end
