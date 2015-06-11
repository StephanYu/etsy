class PagesController < ApplicationController
  
  def home
    if params[:category].blank?
      @listings = Listing.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 8)
    else
      @category = Category.find_by(name: params[:category])
      @category_id = @category.id
      @listings = Listing.where(category_id: @category_id).order('created_at DESC').paginate(:page => params[:page], :per_page => 8)
    end
  end

  def about
  end

  def contact
  end
end
