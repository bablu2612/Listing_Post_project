class BuyerListingsController < ApplicationController
  before_action :set_buyer_listing, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /buyer_listings or /buyer_listings.json
  def index
    if current_user&.role == "buyer"
      @buyer_listings = current_user.buyer_listings.all.order(created_at: :desc)
    else
      redirect_to root_path
    end
  end

  # GET /buyer_listings/1 or /buyer_listings/1.json
  def show
    @seller_listings = @buyer_listing.seller_listings
    @seller_listing = @buyer_listing.seller_listings.find_by(user_id: current_user&.id)
  end

  # GET /buyer_listings/new
  def new
    @buyer_listing = BuyerListing.new
  end

  # GET /buyer_listings/1/edit
  def edit
  end

  # POST /buyer_listings or /buyer_listings.json
  def create
    @buyer_listing = current_user.buyer_listings.new(buyer_listing_params)

    respond_to do |format|
      if @buyer_listing.save
        format.html { redirect_to buyer_listings_path, notice: "Car Details was successfully Submitted." }
        format.json { render :show, status: :created, location: @buyer_listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @buyer_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buyer_listings/1 or /buyer_listings/1.json
  def update
    respond_to do |format|
      if @buyer_listing.update(buyer_listing_params)
        format.html { redirect_to buyer_listing_url(@buyer_listing), notice: "Buyer listing was successfully updated." }
        format.json { render :show, status: :ok, location: @buyer_listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @buyer_listing.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def publish_listing
    publish = params[:publish] == "true" ? true : false
    buyer_listing = BuyerListing.find(params[:id]).update(published: publish)
  end

  # DELETE /buyer_listings/1 or /buyer_listings/1.json
  def destroy
    @buyer_listing.destroy

    respond_to do |format|
      format.html { redirect_to buyer_listings_url, notice: "Buyer listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buyer_listing
      @buyer_listing = BuyerListing.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def buyer_listing_params
      params.require(:buyer_listing).permit(:user_id, :min_year,:max_year, :make, :model, :trim, :mileage, :exterior_color, :interior_color, :transportation, :departure, :payment_term,  :max_price, :min_price)
    end
end
