class ProductsController < ApplicationController
  def index
    @products = if params[:search]
                  Product.search(params[:search]).order(created_at: :desc).paginate(page: params[:page], per_page: 12)
                else
                  Product.all.order(created_at: :desc).paginate(page: params[:page], per_page: 12)
                end
  end

  def recent
    @products = Product.recent.paginate(page: params[:page], per_page: 12)
    render action: :index
  end

  def oldest
    @products = Product.oldest.paginate(page: params[:page], per_page: 12)
    render action: :index
  end

  #def rating
  #  @products =
  #  render action: :index
  #end

  def show
    @product = Product.find(params[:id])
    @comments = @product.comments
    total = @comments&.sum(:rating)
    @average_rating = total.to_f / @comments.count
  end
end
