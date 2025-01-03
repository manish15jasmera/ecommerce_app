class OrderStatus < ApplicationRecord
  has_many :orders, dependent: :destroy 

  validates :name, presence: true, uniqueness: true
end
