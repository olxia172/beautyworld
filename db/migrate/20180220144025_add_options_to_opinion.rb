class AddOptionsToOpinion < ActiveRecord::Migration[5.1]
  def change
    add_column :opinions, :rate, :integer, null: false
    add_column :opinions, :hit, :boolean, default: false, null: false
    add_column :opinions, :buy_again, :boolean, default: false, null: false
  end
end
