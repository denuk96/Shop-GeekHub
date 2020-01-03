# == Schema Information
#
# Table name: products
#
#  id                    :bigint           not null, primary key
#  title                 :string
#  description           :text
#  price                 :decimal(, )
#  category_id           :bigint           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  images                :string           default([]), is an Array
#  cached_comments_total :integer          default(0)
#

class Product < ApplicationRecord
  mount_uploaders :images, ImageUploader
  belongs_to :category
  has_many :comments

  validates :title, :description, :price, presence: true
  validates :title, uniqueness: true

  scope :recent, -> { order("created_at DESC") }
  scope :oldest, -> { order(created_at: :asc) }
  scope :cheapest, -> { order('price ASC') }
  scope :expensive, -> { order('price DESC') }
  scope :average_rating, -> { includes(:comments).order('comments.rating') }
end
