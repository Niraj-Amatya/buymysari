class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :listings
  has_many :orders

  acts_as_messageable

  def name
    "User #{id}"
  end

  def mailboxer_email(object)
    nil
  end
end
