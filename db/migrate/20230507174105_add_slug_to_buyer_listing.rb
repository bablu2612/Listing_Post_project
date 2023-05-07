class AddSlugToBuyerListing < ActiveRecord::Migration[6.1]
  def change
    add_column :buyer_listings, :slug, :string
    add_index :buyer_listings, :slug, unique: true
  end
end
