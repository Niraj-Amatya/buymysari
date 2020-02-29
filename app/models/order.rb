class Order < ApplicationRecord
  belongs_to :user #user is a buyer
  belongs_to :listing
end
