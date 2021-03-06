class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show] 
  before_filter :check_user, only: [:edit, :update, :destroy]

  def seller
    @listings ||= Listing.where(user: current_user).order('created_at DESC')
  end

  def search
    if params[:search].present?
      @listings = Listing.search(params[:search])
    else
      @listings = Listing.all
    end
  end

  def index
    if params[:category].blank?
      @listings ||= Listing.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 8)
      @listings = @listings.where("price > ?", params[:min_price]) if params[:min_price].present?
      @listings = @listings.where("price < ?", params[:max_price]) if params[:max_price].present?
    else
      @category ||= Category.find_by(name: params[:category])
      @category_id = @category.id
      @listings = Listing.where(category_id: @category_id).order('created_at DESC').paginate(:page => params[:page], :per_page => 8)

      @listings = @listings.where("price > ?", params[:min_price]) if params[:min_price].present?
      @listings = @listings.where("price < ?", params[:max_price]) if params[:max_price].present?
    end
  end

  def show
    @reviews = Review.where(listing_id: @listing.id).order("created_at DESC")
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  def new
    @listing = Listing.new
  end

  def edit
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id

    if current_user.recipient.blank?
      Stripe.api_key = ENV["STRIPE_API_KEY"]
      token = params[:stripeToken]
      name = "#{current_user.first_name} #{current_user.last_name}" 

      recipient = Stripe::Recipient.create(
        :name => name,
        :type => "individual",
        :bank_account => token
        )
      current_user.update_attribute(:recipient, recipient.id)
    end
    
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

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

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :category_id, :description, :price, :image)
    end

    def check_user 
      if current_user != @listing.user
        redirect_to root_url, alert: "You do not have permission to edit this post!"
      end
    end
end
