class ProductsController < ApplicationController
  PRODUCTS_PER_PAGE = 18
  NUMBER_OF_PRODUCTS = Product.count


  def index
    @page = params.fetch(:page, 0).to_i
    @products = Product.offset(@page * PRODUCTS_PER_PAGE).limit(PRODUCTS_PER_PAGE)

    if params[:search_by_category] && params[:search_by_category] != ""
        @products = @products.joins(:category).where(categories: {name: params[:search_by_category]})
    end
  end

  def show
    @product = Product.find(params[:id])
  end

end
