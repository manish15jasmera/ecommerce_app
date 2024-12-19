class PaymentMethod < ApplicationRecord
  belongs_to :order

  validates :method, presence: true
  validates :details, presence: true 
end
