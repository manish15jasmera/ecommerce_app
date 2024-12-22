class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true, uniqueness: true

  before_destroy :purge_image

  private

  def purge_image
    self.image.purge if image.attached?
  end
end
