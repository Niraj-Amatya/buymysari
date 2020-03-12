class Comment < ApplicationRecord
  # comment belongs to listing as with every listing user can
  # make comment
  belongs_to :listing
end
