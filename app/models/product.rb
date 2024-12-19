class Product < ApplicationRecord
  belongs_to :category, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items
  has_many :orders, through: :cart_items

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
