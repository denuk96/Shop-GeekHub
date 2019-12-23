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
  has_many :products, dependent: :destroy

  validates :title, :description, presence: true
  validates :title, uniqueness: true
  mount_uploader :image, ImageUploader
end
