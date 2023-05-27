class ShoppingListsController < ApplicationController

  def index
    # raise
    @shoppings = ShoppingList.all
    @product = Product.all
  end

  def new
    @selected_products = params[:category][:category].drop(1)

    @products = @selected_products.map do |id|
      Product.find(id)

    end
  end

  # def create
  #   @chosen_products = params[:products]
  #   # @products = @chosen_products.map do |id|
  #   #   Product.find(id)
  #   #   raise

  # end
end
