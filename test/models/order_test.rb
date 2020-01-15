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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
