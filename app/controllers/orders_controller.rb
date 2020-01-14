class OrdersController < ApplicationController
  before_action :cart_empty?, only: :new
  before_action :set_cart, only: :create

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.add_cart_items_from_cart(@cart)
    @order.user_id = current_user.id
    @order.total_price = @cart.total_price
    #byebug
    if @order.save
      redirect_to purchase_order_path(@order)
      flash[:notice] = 'saved'
    else
      render :new
    end
  end

  private

  def set_cart
    @cart = Cart.find_by_user_id(current_user.id)
  end

  def cart_empty?
    set_cart
    redirect_to request.referrer, alert: 'Cart is empty' if @cart.cart_items.empty?
  end

  def order_params
    params.require(:order).permit(:full_name, :address, :phone)
  end
end
