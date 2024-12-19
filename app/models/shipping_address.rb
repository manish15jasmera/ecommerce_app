class ShippingAddress < ApplicationRecord
  belongs_to :user

  validates :street, :city, :state, :postal_code, :country, presence: true
end
