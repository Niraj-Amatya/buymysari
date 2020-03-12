
class Listing < ApplicationRecord
  # category as enum, user as a seller
  enum category: { party: 0, casual: 1 }
  # these are the fields that are acceptable
  validates :title, :price, :color, :fabric, :description, :category, presence: true
  # listing belongs to user, so listing will have user_id as a foreign key
  belongs_to :user
  has_one :order
  has_one_attached :picture
  has_many :comments, dependent: :destroy
  belongs_to :style

end
