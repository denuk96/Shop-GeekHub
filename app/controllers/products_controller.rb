class ProductsController < ApplicationController
  def index
    @products = if params[:search]
                  Product.search(params[:search]).paginate(page: params[:page], per_page: 9)
                else
                  Product.all.paginate(page: params[:page], per_page: 9)
                end
  end

  def show
    @product = Product.find(params[:id])
  end
end
