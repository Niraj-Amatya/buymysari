class AddStyleRefToListings < ActiveRecord::Migration[5.2]
  def change
    add_reference :listings, :style, foreign_key: true
  end
end
