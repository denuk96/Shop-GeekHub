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

class Product < ApplicationRecord
  mount_uploaders :images, ImageUploader
  has_rich_text :description

  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :comments, dependent: :destroy
  has_many :cart_items

  validates_presence_of :product_categories, message: I18n.t('models.product_category.category_blank')
  validates :title, :description, presence: true, uniqueness: true
  validates :price, length: { maximum: 8 }, presence: true

  scope :recent, -> { order('created_at DESC') }
  scope :oldest, -> { order(created_at: :asc) }
  scope :cheapest, -> { order(price: :asc) }
  scope :expensive, -> { order('price DESC') }

  before_destroy :ensure_not_referenced_by_any_cart_item

  def to_param
    "#{id} - #{title}".parameterize
  end

  def ensure_not_referenced_by_any_cart_item
    if cart_items.present?
      errors.add(:base, 'exist cart_item')
      false
    end
  end
end
