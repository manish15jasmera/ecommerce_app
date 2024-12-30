class Order < ApplicationRecord
  belongs_to :user
  belongs_to :order_status
  belongs_to :payment_method, optional: true
  belongs_to :shipping_address, optional: true 
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  has_many :order_items
  has_many :products, through: :order_items
  

  validates :total_price, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true
end
