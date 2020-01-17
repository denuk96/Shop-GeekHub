class Backoffice::CartItemsController < Backoffice::BackofficeController
  before_action :set_order_and_cart_item, only: %i[increase_cart_item decrease_cart_item]

  def increase_cart_item
    @cart_item.quantity += 1
    @cart_item.save
    verify_price(@order)
    redirect_to request.referrer
  end

  def decrease_cart_item
    @cart_item.quantity -= 1
    if @cart_item.quantity > 0
      @cart_item.save
      verify_price(@order)
      redirect_to request.referrer
    else
      @cart_item.destroy
      verify_price(@order)
      redirect_to request.referrer
    end
  end

  private

  def verify_price(order)
    @order.total_price = order.cart_items.to_a.sum(&:total_price)
    @order.save
  end

  def set_order_and_cart_item
    @order = Order.find_by(id: params[:order_id])
    @cart_item = @order.cart_items.find_by(id: params[:cart_item_id])
  end
end
