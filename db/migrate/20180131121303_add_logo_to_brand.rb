class AddLogoToBrand < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :logo, :string
  end
end
