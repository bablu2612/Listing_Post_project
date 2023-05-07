class BuyerListing < ApplicationRecord
  belongs_to :user

  has_many :seller_listings, dependent: :destroy
  extend FriendlyId
  # friendly_id :name, use: :slugged
  friendly_id :generated_slug, use: :slugged
  def generated_slug
    require 'securerandom' 
    @random_slug ||= persisted? ? friendly_id : SecureRandom.hex(15) 
  end
end
