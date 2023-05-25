class ShoppingListsController < ApplicationController

  def index
    # raise
    @shoppings = ShoppingList.all
    @product = Product.all
  end
end
