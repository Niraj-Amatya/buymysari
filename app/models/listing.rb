class Listing < ApplicationRecord
  enum category: { party: 0, casual: 1 }
  validates :title, :price, :color, :fabric, :description, :category, presence: true
  belongs_to :user
  has_one :order
end
