class ApartmentsController < ApplicationController
  before_filter :init_menu
  # GET /apartments
  # GET /apartments.json
  def index
    @house = House.find(params[:house_id])
    @apartments = @house.apartments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apartments }
    end
  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
    @house = House.find(params[:house_id])
    @apartment = Apartment.find(params[:id])
    @gallery = Gallery.get_gallery_for_apartment(@apartment.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @apartment }
    end
  end
end
