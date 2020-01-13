class CartItemsController < ApplicationController
  before_action :set_cart
  before_action :set_cart_item, only: %i[destroy]

  def create
    @product = Product.find_by(id: params[:product_id])
    if CartItem.find_by(product_id: params[:product_id], price: @product.price).present?
      if check_price
        @cart_item = CartItem.find_by(product_id: params[:product_id], price: @product.price)
        @cart_item.quantity += 1
      else
        @cart_item = CartItem.new
      end
    else
      @cart_item = CartItem.new
    end
    @cart_item.cart_id = @cart.id
    @cart_item.product_id = params[:product_id]
    @cart_item.price = Product.find_by(id: params[:product_id]).price
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
    redirect_to request.referrer, notice: 'removed'
  end

  def increase_cart_item
    @cart_item = CartItem.find(params[:cart_item])
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to request.referrer
  end

  def decrease_cart_item
    @cart_item = CartItem.find(params[:cart_item])
    @cart_item.quantity -= 1
    if @cart_item.quantity > 0
      @cart_item.save
      redirect_to request.referrer
    else
      destroy
    end
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def set_cart
    @cart = Cart.find_by_user_id(current_user.id)
  end

  # if customer adds product to cart with x price, it'd keep price x for current product
  # even we change it. If product price and cart_item price equal, quantity increases,
  # otherwise it creates a new cart item in create method
  def check_price
    cart_items = CartItem.where(product_id: params[:product_id])
    cart_items.each do |cart_item|
      true if @product.price == cart_item.price
    end
  end
end
