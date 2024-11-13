class ProductsController < ApplicationController
  PAGE_SIZE = 20
  TOTAL_PRODUCTS = Product.count


  def index
    @page = params.fetch(:page, 0).to_i
    @products = Product.offset(@page * PAGE_SIZE).limit(PAGE_SIZE)
    @total_pages = (TOTAL_PRODUCTS + PAGE_SIZE - 1) / PAGE_SIZE

    if params[:search_by_category] && params[:search_by_category] != ""
        @products = @products.joins(:category).where(categories: {name: params[:search_by_category]})
    end

    if @page < 0
      redirect_to products_path(page: 0)
    end

    if @page > @total_pages
      redirect_to products_path(page: @total_pages)
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.where("name LIKE ?", "%#{params[:search_term]}%")
  end

end
