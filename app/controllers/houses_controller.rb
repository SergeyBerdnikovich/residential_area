class HousesController < ApplicationController
  # GET /houses/1
  # GET /houses/1.json
  def show
    @house = House.find(params[:id])
    @residential_apartments = Apartment.get_residential.for(@house)
    @not_residential_apartments = Apartment.get_not_residential.for(@house)
    @location = Location.find_by_house_id(@house)
    @json = @location.to_gmaps4rails if @location
    @gallery = Gallery.for_house(@house)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @house }
    end
  end
end
