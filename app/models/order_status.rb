class OrderStatus < ApplicationRecord
  has_many :orders, dependent: :nullify 

  validates :name, presence: true, uniqueness: true
end
