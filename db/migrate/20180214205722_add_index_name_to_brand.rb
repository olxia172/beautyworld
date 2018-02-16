class AddIndexNameToBrand < ActiveRecord::Migration[5.1]
  def change
    add_index :brands, :name
  end
end
