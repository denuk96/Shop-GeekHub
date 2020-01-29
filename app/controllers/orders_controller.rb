class OrdersController < ApplicationController
  include CheckAuthorization
  include SetCart
  before_action :user_logged_in?
  before_action :cart_empty?, only: %i[new create]
  before_action :set_cart, only: :create

  def index
    @orders = Order.where(user_id: current_user.id).order(updated_at: :desc)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.add_cart_items_from_cart(@cart)
    @order.user_id = current_user.id
    @order.total_price = @cart.total_price
    if @order.save
      redirect_to purchase_orders_path, notice: t('controllers.order.create')
    else
      render :new
    end
  end

  private

  def cart_empty?
    set_cart
    redirect_to request.referrer, alert: t('controllers.order.empty') if @cart.cart_items.empty?
  end

  def order_params
    params.require(:order).permit(:full_name, :address, :phone)
  end
end
