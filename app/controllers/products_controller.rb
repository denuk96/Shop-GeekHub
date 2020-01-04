class ProductsController < ApplicationController
  def index
    @products = if params[:search]
                  Product.search(params[:search]).order(created_at: :desc).paginate(page: params[:page], per_page: 12)
                elsif params[:sort] == 'cheapest'
                  Product.all.cheapest.paginate(page: params[:page], per_page: 12)
                elsif params[:sort] == 'expensive'
                  Product.all.expensive.paginate(page: params[:page], per_page: 12)
                elsif params[:sort] == 'oldest'
                  Product.all.oldest.paginate(page: params[:page], per_page: 12)
                elsif params[:sort] == 'popular'
                  Product.all.order('cached_comments_total, created_at DESC').paginate(page: params[:page], per_page: 12)
                elsif params[:sort] == 'best'
                  Product.all.average_rating.paginate(page: params[:page], per_page: 12)
                else
                  Product.all.order(created_at: :desc).paginate(page: params[:page], per_page: 12)
                end
    @categories = Category.all
    @products = @products.where(category_id: params[:category]) if params[:category].present?
  end

  def show
    @product = Product.find(params[:id])
    @comments = @product.comments
    total = @comments&.sum(:rating)
    @average_rating = total.to_f / @comments.count
  end
end
