class SearchController < ApplicationController
  def show
    @results = Elasticsearch::Model.search(query, [Product, Brand]).page(params[:page]).per(5).records
  end

  private

  def query
    params[:query]
  end
end
