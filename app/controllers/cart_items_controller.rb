class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[destroy]

  def create
    @cart_item = CartItem.new
    @cart = Cart.find_by_user_id(current_user.id)
    @cart_item.cart_id = @cart.id
    @cart_item.product_id = params[:product_id]
    if @cart_item.save
      redirect_to request.referrer
      flash[:notice] = 'added to cart'
    else
      redirect_to request.referrer
      flash[:notice] = @cart_item.errors.full_messages.first
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to request.referrer, notice: 'destroyed'
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end
end
