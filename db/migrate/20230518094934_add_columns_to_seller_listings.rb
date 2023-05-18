class AddColumnsToSellerListings < ActiveRecord::Migration[6.1]
  def change
    add_column :seller_listings, :make, :string
    add_column :seller_listings, :model, :string
    add_column :seller_listings, :trim, :string
    add_column :seller_listings, :mileage, :string
  end
end
