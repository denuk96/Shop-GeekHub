# == Schema Information
#
# Table name: orders
#
#  id          :bigint           not null, primary key
#  full_name   :string
#  address     :text
#  user_id     :bigint           not null
#  status      :string           default("new")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  phone       :integer
#  total_price :float
#

class Order < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  validates :full_name, :address, :phone, presence: true

  def add_cart_items_from_cart(cart)
    cart.cart_items.each do |item|
      item.cart_id = nil
      cart_items << item
    end
  end
end
