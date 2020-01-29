class CartsController < ApplicationController
  include CheckAuthorization
  include SetCart
  before_action :user_logged_in?
  before_action :set_cart

  def show
    @cart_items = CartItem.all.where(cart_id: @cart.id).order(created_at: :desc)
  end

  def destroy
    @cart.destroy
    redirect_to request.referrer, notice: t('controllers.cart.destroy')
    set_cart
  end
end
