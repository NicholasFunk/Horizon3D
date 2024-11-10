class ProductsController < ApplicationController
  PRODUCTS_PER_PAGE = 10

  def index
    @page = params.fetch(:page, 0).to_i
    @products = Product.offset(@page * PRODUCTS_PER_PAGE).limit(PRODUCTS_PER_PAGE)
  end

end
