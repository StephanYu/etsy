class PagesController < ApplicationController
  
  def home
    @listings ||= Listing.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 8)
  end

  def about
  end

  def contact
  end
end
