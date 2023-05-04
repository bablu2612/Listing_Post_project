class CreateSellerListings < ActiveRecord::Migration[6.1]
  def change
    create_table :seller_listings do |t|
      t.references :buyer_listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
