class SellersController < ApplicationController
  before_action :set_buyer_listing, only: %i[ show edit update destroy offer_action ]
  skip_before_action :verify_authenticity_token

  # GET /buyer_listings or /buyer_listings.json
  def index

    @buyer_listings = current_user.buyer_listings.all.order(created_at: :desc)

    # @buyer_listings = BuyerListing.all.joins(:seller_listings).where("seller_listings.user_id = #{current_user.id}").order(created_at: :desc)
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
    @seller_listing = SellerListing.find_or_initialize_by(user_id: current_user.id)
    @seller_listing.assign_attributes(year: params[:year],mileage: params[:mileage],trim: params[:trim],make: params[:make],model: params[:model], interior_color: params[:interior_color], exterior_color: params[:exterior_color], offered_price: params[:offered_price], buyer_listing_id: params[:buyer_listing_id])
    if params[:files].present?
      @seller_listing.assign_attributes(files: params[:files])
    end

    respond_to do |format|
      if @seller_listing.save
        format.html { redirect_to @seller_listing.buyer_listing, notice: "Car Attachments was successfully Submitted." }
        format.json { render :show, status: :created, location: @seller_listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @seller_listing.errors, status: :unprocessable_entity }
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

  def offer_action
    

    @seller_listing= SellerListing.find(params[:id])
    @seller_listing.is_accepted = params[:value] == 'true' ? true : false
    @seller_listing.save


    render json: {status: 200,message: "sucessfully updated",data: @seller_listing}

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
      params.require(:buyer_listing).permit(:user_id, :min_year,:max_year, :make, :model, :trim, :mileage, :exterior_color, :interior_color, :transportation, :departure, :payment_term,  :max_price, :min_price)
    end
end
