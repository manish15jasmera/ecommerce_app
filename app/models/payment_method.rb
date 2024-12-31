class PaymentMethod < ApplicationRecord
  has_many :orders

  validates :method, presence: true, uniqueness: true
end
