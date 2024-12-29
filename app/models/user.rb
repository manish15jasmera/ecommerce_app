class User < ApplicationRecord
  enum role: { customer: 'customer', admin: 'admin' }
  has_one :cart, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy
  has_one :profile, dependent: :destroy

  after_initialize do
    self.role ||= 'customer' if new_record?
  end
  
  after_create :create_cart
  
  after_create :send_welcome_email

  after_create :build_default_profile

  validates :role, presence: true, inclusion: { in: roles.keys }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  private

    def create_cart
      Cart.create(user: self)
    end

    def send_welcome_email
      UserMailer.welcome_email(self).deliver_now
    end

    def build_default_profile
      create_profile
    end
end
