module BrandHelper
  def find_sorted_brands(letter)
    Brand.where("name like ?", "#{letter}%").order(:name)
  end

  def brands_grouped_by_letter
    Brand.order(:name).group_by { |brand| brand.name[0].upcase }
  end
end
