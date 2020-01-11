# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#

class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories

  validates :title, :description, presence: true
  validates :title, uniqueness: true
  mount_uploader :image, ImageUploader

  def to_param
    "#{id} - #{title}".parameterize
  end
end
