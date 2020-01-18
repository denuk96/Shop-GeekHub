# == Schema Information
#
# Table name: orders
#
#  id            :bigint           not null, primary key
#  full_name     :string
#  address       :text
#  user_id       :bigint           not null
#  status        :string           default("new")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  phone         :integer
#  total_price   :float
#  admin_comment :string
#

class Order < ApplicationRecord
  STATUS_TYPES = ['new', 'in progress', 'completed', 'cancelled'].freeze

  belongs_to :user
  has_many :cart_items, dependent: :destroy

  validates :full_name, :address, :phone, presence: true
  validates :status, inclusion: STATUS_TYPES

  scope :new_order, -> { where(status: 'new') }
  scope :in_progress, -> { where(status: 'in progress') }
  scope :completed, -> { where(status: 'completed') }
  scope :cancelled, -> { where(status: 'cancelled') }

  after_create :send_confirmation

  def add_cart_items_from_cart(cart)
    cart.cart_items.each do |item|
      item.cart_id = nil
      cart_items << item
    end
  end

  private

  def send_confirmation
    OrderMailer.confirmation(self).deliver!
  end
end
