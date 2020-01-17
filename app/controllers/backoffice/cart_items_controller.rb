class Backoffice::CartItemsController < Backoffice::BackofficeController
  before_action :set_order_and_cart_item, only: %i[increase_cart_item decrease_cart_item]

  def increase_cart_item
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to request.referrer
  end

  def decrease_cart_item
    @cart_item.quantity -= 1
    if @cart_item.quantity > 0
      @cart_item.save
      redirect_to request.referrer
    else
      @cart_item.destroy
      redirect_to request.referrer
    end
  end

  private

  def set_order_and_cart_item
    @order = Order.find_by(id: params[:order_id])
    @cart_item = @order.cart_items.find_by(id: params[:cart_item_id])
  end
end
