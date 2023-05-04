json.extract! buyer_listing, :id, :user_id, :year, :make, :model, :trim, :mileage, :exterior_color, :interior_color, :transportation, :departure, :payment_term, :purchase_price, :created_at, :updated_at
json.url buyer_listing_url(buyer_listing, format: :json)
