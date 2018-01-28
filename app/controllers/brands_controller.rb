class BrandsController < ApplicationController
  def index
    @brands = Brand.order(:name)
    respond_to do |format|
      format.html
      format.json { render json: @brands.where("name ilike ?", "#{params[:brand]}%") }
    end
  end
end
