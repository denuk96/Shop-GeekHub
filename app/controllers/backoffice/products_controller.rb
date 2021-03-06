class Backoffice::ProductsController < Backoffice::BackofficeController
  before_action :find_product, except: %i[new create index]

  def index
    @products = if params[:search]
                  Product.search(params[:search]).order(created_at: :desc).paginate(page: params[:page], per_page: 20)
                elsif params[:sort] == 'cheapest'
                  Product.all.cheapest.paginate(page: params[:page], per_page: 20)
                elsif params[:sort] == 'expensive'
                  Product.all.expensive.paginate(page: params[:page], per_page: 20)
                elsif params[:sort] == 'oldest'
                  Product.all.oldest.paginate(page: params[:page], per_page: 20)
                elsif params[:sort] == 'popular'
                  Product.all.order('cached_comments_total DESC').paginate(page: params[:page], per_page: 20)
                elsif params[:sort] == 'best'
                  Product.joins(:comments)
                         .group(:id)
                         .order('AVG(comments.rating) DESC')
                         .paginate(page: params[:page], per_page: 20)
                else
                  Product.all.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
                end
    if params[:category]
      @category = Category.find_by(id: params[:category])
      @products = @category.products.paginate(page: params[:page], per_page: 20)
    end
  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin: @product
      flash[:notice] = t('controllers.products.created')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product.update_attributes(product_params)
      redirect_to admin: @product
      flash[:notice] = t('controllers.products.edited')
    else
      render :edit
    end
  end

  def destroy
    if @product.cart_items.present?
      redirect_to request.referrer, alert: t('controllers.products.product_exist')
    else
      @product.destroy
      redirect_to admin_products_path, notice: t('controllers.products.destroyed')
    end
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, images: [], category_ids: [])
  end
end
