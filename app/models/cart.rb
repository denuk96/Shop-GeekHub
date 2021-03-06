# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#

class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  def total_price
    cart_items.to_a.sum(&:total_price)
  end
end
