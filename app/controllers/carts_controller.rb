class CartsController < ApplicationController
  before_action :set_cart

  def show
    @cart_items = CartItem.all.where(cart_id: @cart.id).order(created_at: :desc)
  end

  def destroy
    @cart.destroy
    create_or_set_cart
    redirect_to request.referrer, notice: 'cleared'
  end

  private

  def set_cart
    @cart = Cart.find_by_user_id(current_user.id)
  end
end
