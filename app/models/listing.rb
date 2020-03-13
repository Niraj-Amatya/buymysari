
class Listing < ApplicationRecord
  # category as enum, user as a seller
  enum category: { party: 0, casual: 1 }
  # these are the fields that are acceptable
  validates :title, :price, :color, :fabric, :description, :category, presence: true
  # listing belongs to user, so listing will have user_id as a foreign key
  belongs_to :user
  # so one listing will have only one order, as this is our business logic
  has_one :order
  # with listing you can only upload one picture
  has_one_attached :picture
  # listing will have many comments but the user should be login
  has_many :comments, dependent: :destroy
  #  listing belongs to style and has style_id as a foreign key
  belongs_to :style

end
