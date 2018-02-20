class MainPageController < ApplicationController
  def index
    @products = last_added_products
  end

  private

  def last_added_products
    Product.order(created_at: :desc).limit(6)
  end
end
