class BoughtItemsController < ApplicationController
  def index
    @shopping = ShoppingList.all
    @product = Product.all
    @user = User.all
    # raise
  end


end
