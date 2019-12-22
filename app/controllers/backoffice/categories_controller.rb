class Backoffice::CategoriesController < Backoffice::BackofficeController
  before_action :find_category, except: %i[new create index]

  def index
    @categories = if params[:search]
                    Category.search(params[:search]).order(created_at: :desc).paginate(page: params[:page], per_page: 20)
                  else
                    Category.all.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
                  end
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin: @category
      flash[:notice] = 'Category has been added'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes(category_params)
      redirect_to admin: @category
      flash[:notice] = 'Category has been edited'
    else
      format.html { render :edit }
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, notice: 'Category was successfully destroyed.'
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
