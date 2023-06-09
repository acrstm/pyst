class BoughtItemsController < ApplicationController
  def index
    @user = current_user
    @shopping_list = ShoppingList.new
  end


end
