class AddCategoryToListing < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :category, :integer
  end
end
