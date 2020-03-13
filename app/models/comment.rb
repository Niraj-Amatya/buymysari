class Comment < ApplicationRecord
  # comment belongs to listing as with every listings user can
  # make comment and as you delete the any listing it will delete the comment
  belongs_to :listing
end
