class SellerListing < ApplicationRecord
  belongs_to :buyer_listing

  has_many_attached :files, dependent: :destroy
  validates_presence_of :year, :interior_color, :exterior_color, :files, :offered_price
end
