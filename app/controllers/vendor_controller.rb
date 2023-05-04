class VendorController < ApplicationController
  before_action :set_buyer_listing, only: %i[ show edit update destroy ]

  # GET /buyer_listings or /buyer_listings.json
  def index
    
  end

  # GET /buyer_listings/1 or /buyer_listings/1.json
  def show
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
    @buyer_listing = BuyerListing.new(buyer_listing_params)

    respond_to do |format|
      if @buyer_listing.save
        format.html { redirect_to buyer_listing_url(@buyer_listing), notice: "Buyer listing was successfully created." }
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
      @buyer_listing = BuyerListing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def buyer_listing_params
      params.require(:buyer_listing).permit(:user_id, :year, :make, :model, :trim, :mileage, :exterior_color, :interior_color, :transportation, :departure, :payment_term, :purchase_price)
    end
end
