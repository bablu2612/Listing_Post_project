class BuyerListing < ApplicationRecord
  belongs_to :user

  has_many :seller_listings, dependent: :destroy
end
