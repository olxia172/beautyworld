class BrandsController < ApplicationController
  before_action :find_brand, only: [:show, :edit, :update, :destroy]
  def index
    @brands = Brand.order(:name)
    @search_brands = Brand.where("name ilike ?", "%#{params[:search]}%")
  end

  def show
    @products = Product.where(brand: @brand).page(params[:page]).per(5)
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to brand_path(@brand), notice: "You successfully added new brand!"
    else
      flash.now.alert = "Something went wrong. Check if all fields are properly completed"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @brand.update(brand_params)
      redirect_to brand_path(@brand), notice: "You successfully updated this brand!"
    else
      flash.now.alert = "Something went wrong. Check if all fields are properly completed"
      redner 'edit'
    end
  end

  def destroy
    @brand.destroy
    redirect_to brands_path
  end

private

  def find_brand
    @brand = Brand.find(params[:id])
  end

  def brand_params
    params.require(:brand).permit(:name, :description, :logo)
  end
end
