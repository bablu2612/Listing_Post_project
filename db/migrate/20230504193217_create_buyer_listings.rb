class CreateBuyerListings < ActiveRecord::Migration[6.1]
  def change
    create_table :buyer_listings do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :year
      t.string :make
      t.string :model
      t.string :trim
      t.string :mileage
      t.string :exterior_color
      t.string :interior_color
      t.string :transportation
      t.string :departure
      t.string :payment_term
      t.string :purchase_price

      t.timestamps
    end
  end
end
