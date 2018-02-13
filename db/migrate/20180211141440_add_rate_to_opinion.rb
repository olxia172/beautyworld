class AddRateToOpinion < ActiveRecord::Migration[5.1]
  def change
    add_column :opinions, :rate, :integer
  end
end
