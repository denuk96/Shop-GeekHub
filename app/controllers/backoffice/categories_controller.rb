class Backoffice::CategoriesController < Backoffice::BackofficeController
  def index
    @categories = Category.all.order(created_at: :desc).paginate(page: params[:page], per_page: 8)
  end

  def show
    @category = Category.find(params[:id])
  end
end
