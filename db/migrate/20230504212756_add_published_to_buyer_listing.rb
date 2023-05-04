class AddPublishedToBuyerListing < ActiveRecord::Migration[6.1]
  def change
    add_column :buyer_listings, :published, :boolean
  end
end
