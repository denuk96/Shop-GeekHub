class OrdersController < ApplicationController
  before_action :cart_empty?, only: :new
  before_action :set_cart

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(product_params)
    if @order.save
      redirect_to home_path
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
