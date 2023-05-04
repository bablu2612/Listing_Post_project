require "test_helper"

class BuyerListingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @buyer_listing = buyer_listings(:one)
  end

  test "should get index" do
    get buyer_listings_url
    assert_response :success
  end

  test "should get new" do
    get new_buyer_listing_url
    assert_response :success
  end

  test "should create buyer_listing" do
    assert_difference('BuyerListing.count') do
      post buyer_listings_url, params: { buyer_listing: { departure: @buyer_listing.departure, exterior_color: @buyer_listing.exterior_color, interior_color: @buyer_listing.interior_color, make: @buyer_listing.make, mileage: @buyer_listing.mileage, model: @buyer_listing.model, payment_term: @buyer_listing.payment_term, purchase_price: @buyer_listing.purchase_price, transportation: @buyer_listing.transportation, trim: @buyer_listing.trim, user_id: @buyer_listing.user_id, year: @buyer_listing.year } }
    end

    assert_redirected_to buyer_listing_url(BuyerListing.last)
  end

  test "should show buyer_listing" do
    get buyer_listing_url(@buyer_listing)
    assert_response :success
  end

  test "should get edit" do
    get edit_buyer_listing_url(@buyer_listing)
    assert_response :success
  end

  test "should update buyer_listing" do
    patch buyer_listing_url(@buyer_listing), params: { buyer_listing: { departure: @buyer_listing.departure, exterior_color: @buyer_listing.exterior_color, interior_color: @buyer_listing.interior_color, make: @buyer_listing.make, mileage: @buyer_listing.mileage, model: @buyer_listing.model, payment_term: @buyer_listing.payment_term, purchase_price: @buyer_listing.purchase_price, transportation: @buyer_listing.transportation, trim: @buyer_listing.trim, user_id: @buyer_listing.user_id, year: @buyer_listing.year } }
    assert_redirected_to buyer_listing_url(@buyer_listing)
  end

  test "should destroy buyer_listing" do
    assert_difference('BuyerListing.count', -1) do
      delete buyer_listing_url(@buyer_listing)
    end

    assert_redirected_to buyer_listings_url
  end
end
