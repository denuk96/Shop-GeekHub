# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  cart_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#  quantity   :integer          default(1)
#  price      :decimal(, )
#  order_id   :bigint
#

class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true
  belongs_to :order, optional: true

  def total_price
    price * quantity
  end
end
