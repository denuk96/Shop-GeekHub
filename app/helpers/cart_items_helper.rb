module CartItemsHelper
  def already_in_cart?(product)
    true if product.cart_items.where(product_id: product.id, cart_id: current_user.cart).present?
  end
end
