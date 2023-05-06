class AddMinMaxYearToBuyerListing < ActiveRecord::Migration[6.1]
  def change
    rename_column :buyer_listings, :year, :min_year
    add_column :buyer_listings, :max_year, :string
  end
end
