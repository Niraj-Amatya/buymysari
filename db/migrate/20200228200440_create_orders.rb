class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true
      t.string :stripe_id

      t.timestamps
    end
  end
end
