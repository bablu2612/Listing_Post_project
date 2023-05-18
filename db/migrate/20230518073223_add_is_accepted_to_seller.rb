class AddIsAcceptedToSeller < ActiveRecord::Migration[6.1]
  def change
    add_column :seller_listings, :is_accepted, :bool, default: false
  end
end
