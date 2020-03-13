class Style < ApplicationRecord
    # with any style there will be many lsitings, so listing will 
    # have style-id as a foreign key
    has_many :listings
end
