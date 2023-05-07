class AddYearInteriorColorExteriorColorToSellerListing < ActiveRecord::Migration[6.1]
  def change
    add_column :seller_listings, :year, :string
    add_column :seller_listings, :interior_color, :string
    add_column :seller_listings, :exterior_color, :string
  end
end
