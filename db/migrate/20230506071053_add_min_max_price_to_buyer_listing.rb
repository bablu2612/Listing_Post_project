class AddMinMaxPriceToBuyerListing < ActiveRecord::Migration[6.1]
  def change
    rename_column :buyer_listings, :purchase_price, :min_price
    add_column :buyer_listings, :max_price, :string
  end
end
