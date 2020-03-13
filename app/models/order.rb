class Order < ApplicationRecord
  belongs_to :user #user is a buyer and has user_id
  # order has listing_id as a foreign key as listing will have one order
  belongs_to :listing
end
