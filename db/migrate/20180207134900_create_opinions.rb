class CreateOpinions < ActiveRecord::Migration[5.1]
  def change
    create_table :opinions do |t|
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
