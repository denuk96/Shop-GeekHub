# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  price       :decimal(, )
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  images      :string           default([]), is an Array
#

class Product < ApplicationRecord
  mount_uploaders :images, ImageUploader
  belongs_to :category

  validates :title, :description, :price, presence: true
  validates :title, uniqueness: true
end
