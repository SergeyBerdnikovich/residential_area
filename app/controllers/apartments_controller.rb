class ApartmentsController < ApplicationController
  # GET /apartments
  # GET /apartments.json
  def index
    @house = House.find(params[:house_id])
    @apartments = @house.apartments.page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apartments }
      format.js
    end
  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
    @house = House.find(params[:house_id])
    @apartment = Apartment.find(params[:id])
    @gallery = Gallery.for_apartment(@apartment)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @apartment }
    end
  end
end
