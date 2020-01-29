module SetCart
  include ActiveSupport::Concern

  def set_cart
    @cart = if Cart.find_by_user_id(current_user&.id).present?
              Cart.find_by_user_id(current_user.id)
            else
              Cart.create(user_id: current_user.id)
            end
  end
end
