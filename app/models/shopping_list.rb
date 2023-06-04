class ShoppingList < ApplicationRecord
  belongs_to :group, optional: true
end
