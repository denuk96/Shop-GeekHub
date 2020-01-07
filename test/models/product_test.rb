# == Schema Information
#
# Table name: products
#
#  id                    :bigint           not null, primary key
#  title                 :string
#  description           :text
#  price                 :decimal(, )
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  images                :string           default([]), is an Array
#  cached_comments_total :integer          default(0)
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
