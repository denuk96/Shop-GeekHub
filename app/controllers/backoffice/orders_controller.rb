class Backoffice::OrdersController < Backoffice::BackofficeController
  before_action :find_order, only: %i[show destroy edit update change_status]

  def index
    @orders = if params[:search]
                Order.where(id: params[:search]).order(created_at: :desc).paginate(page: params[:page], per_page: 20)
              elsif params[:sort] == 'new'
                Order.all.new_order.paginate(page: params[:page], per_page: 20)
              elsif params[:sort] == 'in progress'
                Order.all.in_progress.paginate(page: params[:page], per_page: 20)
              elsif params[:sort] == 'completed'
                Order.all.completed.paginate(page: params[:page], per_page: 20)
              elsif params[:sort] == 'cancelled'
                Order.all.cancelled.paginate(page: params[:page], per_page: 20)
              else
                Order.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
              end
  end

  def show; end

  def edit; end

  def update
    if @order.update_attributes(order_params)
      redirect_to admin: @order
      flash[:notice] = 'Edited'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to admin_orders_path, notice: 'Order destroyed'
  end

  def change_status
    @order.status = params[:status]
    @order.save
    render :show
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:full_name, :address, :phone)
  end
end
