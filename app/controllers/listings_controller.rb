class ListingsController < ApplicationController
  before_action :set_categories_and_styles, only: [:new, :edit]
  before_action :set_listing, only: [:show]
  before_action :set_user_listing, only: [:edit, :update, :destroy]
  
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  

  # GET /listings
  # GET /listings.json
  def index
    # search function
    @q = Listing.ransack(params[:q])
    @listings = @q.result.includes(style: [])
  end



  # GET /listings/1
  # Stripe payment in the show as user can buy listing from the show page
  # of individual listing.
  def show
    if current_user #user_signed_in?
    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
            name: @listing.title,
            description: @listing.description,
            amount: @listing.price * 100,
            currency: 'aud',
            quantity: 1,
        }],
        payment_intent_data: {
            metadata: {
                user_id: current_user.id,
                listing_id: @listing.id
            }
        },
        success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
        cancel_url: "#{root_url}listings"
  )

  @session_id = session.id
  
    end
  
  end

  # GET /listings/new
  def new
    @listing = current_user.listings.build
    
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = current_user.listings.create(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        # format.json { render :show, status: :created, location: @listing }
      else
        format.html { redirect_to new_listing_path, notice: 'Please fill all the mandatory fields' }
        # format.json { render json: @listing.errors, status: :unprocessable_entity }
        
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
       

      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def set_user_listing
      id = params[:id]
      @listing = current_user.listings.find_by_id(id)
      if
       @listing == nil
        redirect_to listings_path
      end
    end

    def set_categories_and_styles
      @categories = Listing.categories.keys
      @styles = Style.all
    end

    

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :price, :color, :fabric, :description, :user_id, :category, :picture, :style_id)
    end
end
