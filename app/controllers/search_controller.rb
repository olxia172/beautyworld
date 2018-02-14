class SearchController < ApplicationController
  def show
    @results = Elasticsearch::Model.search(query, [Product, Brand]).page(params[:page]).records
    separate_brands_from_products(@results)
  end

  private

  def query
    @query = params[:query]
  end

  def separate_brands_from_products(results)
    @brands = []
    @products = []

    results.each do |result|
      @brands << result if result.class.to_s == 'Brand'
      @products << result if result.class.to_s == 'Product'
    end
  end
end
