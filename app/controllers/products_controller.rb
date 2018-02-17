class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  helper_method :subcategory

  def index
    load_products
    @products = @products.page(params[:page]).per(5)
  end

  def new
    if params[:subcategory_id]
      @product = Product.new(subcategory_id: params[:subcategory_id])
    elsif params[:brand_id]
      @product = Product.new(brand_id: params[:brand_id])
    else
      @product = Product.new
    end
    @product.sub_products.build
  end

  def create
    @product = current_user.products.new(product_params)

    if @product.save
      redirect_to product_path(@product), notice: "You successfully added new product!"
    else
      flash.now.alert = "Something went wrong. Check if all fields are properly completed"
      render 'new'
      # Rails.logger.info("Błędy to: #{@product.errors.full_messages}")
    end
  end

  def show
    @opinion = Opinion.new
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

  def subcategory
    @subcategory ||= Subcategory.find(params[:subcategory_id]) if params[:subcategory_id]
  end

  def product_params
    params.require(:product).permit(:name, :capacity, :description, :brand_id, :subcategory_id, :ingredient_tokens, :image, sub_products_attributes: [:id, :name, :ingredient_tokens])
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def load_products
    if subcategory
      @products = subcategory.products
    elsif params[:brand_id]
      @products = Product.where(brand_id: params[:brand_id])
    else
      @products = Product.all.order(:created_at)
    end
  end
end
