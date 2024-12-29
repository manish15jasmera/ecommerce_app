class Profile < ApplicationRecord
  belongs_to :user

  validates :name, length: { maximum: 50 }
  validates :phone, format: { with: /\A[0-9]{10}\z/, message: "must be a valid 10-digit number" }, allow_blank: true
end
