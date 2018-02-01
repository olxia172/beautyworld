class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @all_products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path(@product), notice: "You successfully added new product!"
    else
      flash.now.alert = "Something went wrong. Check if all fields are properly completed"
      render 'new'
      Rails.logger.info("Błędy to: #{@product.errors.full_messages}")
    end
  end

  def show
  end

  def edit
  end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to product_path(@product), notice: "You successfully updated this product"
    else
      flash.now.alert = "Something went wrong. Check if all fields are properly completed"
      render 'edit'
    end
  end

  def destroy
    product_name = @product.name
    @product.destroy
    redirect_to products_path, notice: "You successfully deleted #{product_name}"
  end

  private

  def product_params
    params.require(:product).permit(:name, :capacity, :brand_id, :subcategory_id, :ingredient_tokens, :image)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
