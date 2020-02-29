class AddBoughtToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :bought, :boolean
  end
end
