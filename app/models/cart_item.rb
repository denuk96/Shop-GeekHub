# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  cart_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#  quantity   :integer          default(1)
#  price      :decimal(, )
#

class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def total_price
    price * quantity
  end
end
