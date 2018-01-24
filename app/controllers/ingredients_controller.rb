class IngredientsController < ApplicationController
  before_action :load_current_function
  before_action :find_ingredient, only: [:edit, :update, :destroy]

  def index
    @all_ingredients = Ingredient.count
    # Rails.logger.info "Letter param to: #{letter_param.inspect}"
    # Rails.logger.info "Function param to: #{function_param.inspect}"
    if letter_param
      @ingredients = Ingredient.where("name like ?", "#{letter_param}%")
    elsif @function
      @ingredients = @function.ingredients
    else
      @ingredients = Ingredient.all.order(name: :asc)
    end
    @functions = IngredientFunction.all.order(name: :asc)
  end

  def edit
  end

private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def letter_param
    params[:sign] if params[:sign] && params[:sign].length == 1
  end

  def function_param
    params[:function]
  end

  def load_current_function
    @function = IngredientFunction.find(function_param) if function_param
  end
end
