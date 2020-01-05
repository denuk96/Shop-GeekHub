class Backoffice::ProductsController < Backoffice::BackofficeController
  before_action :find_product, except: %i[new create index]

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
                  Product.all.order('cached_comments_total DESC').paginate(page: params[:page], per_page: 12)
                elsif params[:sort] == 'best'
                  Product.all.average_rating.paginate(page: params[:page], per_page: 12)

                  #Product.select('product_id, avg(comments.rating')
                  #       .joins(:comments)
                  #       .group('product_id')
                  #       .order('avg(comments.rating) desc')
                  #       .paginate(page: params[:page], per_page: 12)
                  #
                else
                  Product.all.order(created_at: :desc).paginate(page: params[:page], per_page: 12)
                end
    @categories = Category.all
    @products = @products.where(category_id: params[:category]) if params[:category].present?
  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin: @product
      flash[:notice] = 'Product has been added'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product.update_attributes(product_params)
      redirect_to admin: @product
      flash[:notice] = 'Product has been edited'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: 'Product was successfully destroyed.'
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :category_id, :price, images: [])
  end
end
