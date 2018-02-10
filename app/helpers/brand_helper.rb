module BrandHelper
  def find_sorted_brands(letter)
    Brand.where("name like ?", "#{letter}%").order(:name)
  end

  def find_brands_with_first_sign_num
    num_brands = []
    (0..9).each do |num|
      Brand.where("name like ?", "#{num}%").each do |brand|
        num_brands << brand
      end
    end
    num_brands
  end

  def popular_brands
    popular_brands = []
    Brand.all.each do |brand|
      popular_brands << brand if brand.products.count > 0
    end
    popular_brands
  end
end
