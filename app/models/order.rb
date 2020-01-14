# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  full_name  :string
#  address    :text
#  user_id    :bigint           not null
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  phone      :integer
#

class Order < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  validates :full_name, :address, :phone, presence: true
end
