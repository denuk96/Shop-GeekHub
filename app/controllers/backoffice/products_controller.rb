class Backoffice::ProductsController < Backoffice::BackofficeController
  def index
    @products = Product.all.order(created_at: :desc).paginate(page: params[:page], per_page: 8)
  end

  def show
    @product = Product.find(params[:id])
  end
end
