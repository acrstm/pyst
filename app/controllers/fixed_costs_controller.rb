class FixedCostsController < ApplicationController
  def index
    @fixed_costs = FixedCost.all
  end
end
