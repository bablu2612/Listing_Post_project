class SellerListing < ApplicationRecord
  belongs_to :buyer_listing

  has_many_attached :files, dependent: :destroy
end
