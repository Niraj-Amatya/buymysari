class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  user will have many listings to sell so user will create listing
        # when user is deleted lsitings will delete as well
  has_many :listings, dependent: :destroy
  # one user can have many orders so orders will have user_id as foreign key
  has_many :orders, dependent: :destroy
# this is for mailbox, so that user can message each other
  acts_as_messageable

  def name
    "User #{id}"
  end

  def mailboxer_email(object)
    nil
  end
end
