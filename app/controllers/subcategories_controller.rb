class SubcategoriesController < ApplicationController
  before_action :find_subcategory, only: [:show, :destroy]

  def index
    @main_categories = MainCategory.all.order(:id)
    @subcategories = Subcategory.all.order(name: :asc)
  end

  def show
  end

  def new
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
      redirect_to subcategories_path, notice: "You successfully added new cosmetic subcategory"
    else
      flash.now.alert = "Something went wrong. Check if all fields are properly completed"
    end
  end

  def destroy
    subcat_name = @subcategory.name
    @subcategory.destroy
    redirect_to subcategories_path, notice: "You successfully deleted #{subcat_name} category"
  end
  private

  def subcategory_params
    params.require(:subcategory).permit(:name, :main_category_id)
  end

  def find_subcategory
    @subcategory = Subcategory.find(params[:id])
  end
end
