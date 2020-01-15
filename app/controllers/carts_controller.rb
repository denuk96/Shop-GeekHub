class CartsController < ApplicationController
  before_action :user_logged_in?
  before_action :set_cart

  def show
    @cart_items = CartItem.all.where(cart_id: @cart.id).order(updated_at: :desc)
  end

  def destroy
    @cart.destroy
    redirect_to request.referrer, notice: 'cleared'
    set_cart
  end
end
