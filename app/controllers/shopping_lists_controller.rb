class ShoppingListsController < ApplicationController

  def index
    # raise
    @shopping_list = ShoppingList.all
    @products = Product.all
  end

  def new
    @user = current_user
    @shopping_list = ShoppingList.new
    @selected_products = params[:category][:category].drop(1)
    @products = @selected_products.map do |id|
      Product.find(id)
    end
    # raise
  end

  def new_item
    @user = current_user
    @shopping_list = ShoppingList.new
    # @add_product = params[:category][:product]
    # @add_quantity = params[:category][:quantity]
    # raise
    # raise
  end

  def create
    @shopping_list = ShoppingList(shopping_params)
    # raise
  end

  private

  def shopping_params
    params.require(:shopping_list).permit(:category)
  end

  def shopping_newitem
    params.require(:shopping_list).permit(group_id)
  end
end
