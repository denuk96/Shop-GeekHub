class CartsController < ApplicationController
  def show
    @cart = Cart.find_by_user_id(current_user.id)
    @cart_items = CartItem.all.where(cart_id: @cart.id).order(created_at: :desc)
  end
end
