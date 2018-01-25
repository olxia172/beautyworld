class IngredientsController < ApplicationController
  before_action :load_current_function
  before_action :find_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @all_ingredients = Ingredient.count
    # Rails.logger.info "Letter param to: #{letter_sort_param.inspect}"
    # Rails.logger.info "Function param to: #{function_sort_param.inspect}"
    if letter_sort_param
      @ingredients = Ingredient.where("name like ?", "#{letter_sort_param}%")
    elsif @function
      @ingredients = @function.ingredients
    else
      @ingredients = Ingredient.all.order(name: :asc)
    end
    @functions = IngredientFunction.all.order(name: :asc)
  end

  def show
  end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to ingredient_path(@ingredient)
    else
      render 'edit'
    end
  end

private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, ingredient_function_ids: [])
  end

  def letter_sort_param
    params[:sign] if params[:sign] && params[:sign].length == 1
  end

  def function_sort_param
    params[:function]
  end

  def load_current_function
    @function = IngredientFunction.find(function_sort_param) if function_sort_param
  end
end
