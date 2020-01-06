# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :string
#  rating     :integer          default(0)
#  user_id    :bigint           not null
#  product_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product, counter_cache: :cached_comments_total

  validates :rating, presence: true, inclusion: { in: 1..5 }
end
