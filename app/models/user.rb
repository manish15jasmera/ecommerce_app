class User < ApplicationRecord
  enum role: { customer: 'customer', admin: 'admin' }

  has_many :shipping_addresses, dependent: :destroy

  after_initialize do
    self.role ||= 'customer' if new_record?
  end

  validates :role, presence: true, inclusion: { in: roles.keys }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
