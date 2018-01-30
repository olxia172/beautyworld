require "csv"

brand_path = Rails.root.join('tmp/brands.csv')
CSV.foreach(brand_path) do |row|
  Brand.create!(name: row[0])
end
