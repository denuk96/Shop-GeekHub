# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  email            :string           not null
#  crypted_password :string
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  admin            :boolean          default(FALSE)
#

class User < ApplicationRecord
  authenticates_with_sorcery!
  attr_accessor :password, :password_confirmation

  has_many :comments, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, allow_nil: true
  validate :pass_val

  def pass_val
    if password.present?
      if password.count('a-z') <= 0 || password.count('A-Z') <= 0 # || password.count('0-9') <= 0
        errors.add(:password, 'must contain 1 small letter, 1 capital letter, 1 number and minimum 8 symbols')
      end
    end
  end
end
