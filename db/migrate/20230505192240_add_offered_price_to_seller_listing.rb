class AddOfferedPriceToSellerListing < ActiveRecord::Migration[6.1]
  def change
    add_column :seller_listings, :offered_price, :string
    add_reference :seller_listings, :user, null: false, foreign_key: true
  end
end
