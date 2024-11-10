class ProductsController < ApplicationController
  PRODUCTS_PER_PAGE = 20
  NUMBER_OF_PRODUCTS = Product.count


  def index
    @page_max = (NUMBER_OF_PRODUCTS / PRODUCTS_PER_PAGE) - 1
    @page = params.fetch(:page, 0).to_i
    @products = Product.offset(@page * PRODUCTS_PER_PAGE).limit(PRODUCTS_PER_PAGE)
  end

  def show
    @product = Product.find(params[:id])
  end

end
