class ProductsController < ApplicationController

  def demand_pricing
    @products = Product.fetch_products
  end

end
