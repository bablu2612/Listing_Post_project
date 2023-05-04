require "application_system_test_case"

class BuyerListingsTest < ApplicationSystemTestCase
  setup do
    @buyer_listing = buyer_listings(:one)
  end

  test "visiting the index" do
    visit buyer_listings_url
    assert_selector "h1", text: "Buyer Listings"
  end

  test "creating a Buyer listing" do
    visit buyer_listings_url
    click_on "New Buyer Listing"

    fill_in "Departure", with: @buyer_listing.departure
    fill_in "Exterior color", with: @buyer_listing.exterior_color
    fill_in "Interior color", with: @buyer_listing.interior_color
    fill_in "Make", with: @buyer_listing.make
    fill_in "Mileage", with: @buyer_listing.mileage
    fill_in "Model", with: @buyer_listing.model
    fill_in "Payment term", with: @buyer_listing.payment_term
    fill_in "Purchase price", with: @buyer_listing.purchase_price
    fill_in "Transportation", with: @buyer_listing.transportation
    fill_in "Trim", with: @buyer_listing.trim
    fill_in "User", with: @buyer_listing.user_id
    fill_in "Year", with: @buyer_listing.year
    click_on "Create Buyer listing"

    assert_text "Buyer listing was successfully created"
    click_on "Back"
  end

  test "updating a Buyer listing" do
    visit buyer_listings_url
    click_on "Edit", match: :first

    fill_in "Departure", with: @buyer_listing.departure
    fill_in "Exterior color", with: @buyer_listing.exterior_color
    fill_in "Interior color", with: @buyer_listing.interior_color
    fill_in "Make", with: @buyer_listing.make
    fill_in "Mileage", with: @buyer_listing.mileage
    fill_in "Model", with: @buyer_listing.model
    fill_in "Payment term", with: @buyer_listing.payment_term
    fill_in "Purchase price", with: @buyer_listing.purchase_price
    fill_in "Transportation", with: @buyer_listing.transportation
    fill_in "Trim", with: @buyer_listing.trim
    fill_in "User", with: @buyer_listing.user_id
    fill_in "Year", with: @buyer_listing.year
    click_on "Update Buyer listing"

    assert_text "Buyer listing was successfully updated"
    click_on "Back"
  end

  test "destroying a Buyer listing" do
    visit buyer_listings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Buyer listing was successfully destroyed"
  end
end
