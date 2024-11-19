class ProductsController < ApplicationController
  PAGE_SIZE = 20
  TOTAL_PRODUCTS = Product.count


  def index
    @page = params.fetch(:page, 0).to_i
    @products = Product.offset(@page * PAGE_SIZE).limit(PAGE_SIZE)
    @categories = Category.all
    @total_pages = (TOTAL_PRODUCTS + PAGE_SIZE - 1) / PAGE_SIZE


    if params[:search_by_category].present?
        @category = Category.find(params[:search_by_category])
        @products = @products.joins(:category).where(categories: { id: @category.id })
    end

    if @page < 0
      redirect_to products_path(page: 0)
    end

    if @page > @total_pages
      redirect_to products_path(page: @total_pages)
    end
  end

  def show
    @show_product = params[:id].present?
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:search_term]}%", "%#{params[:search_term]}%")
    @categories = Category.all
  end
end
