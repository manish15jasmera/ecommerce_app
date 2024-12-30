class PaymentMethod < ApplicationRecord
  has_many :orders
  # Add validations if necessary, e.g.,
  validates :method, presence: true, uniqueness: true
end
