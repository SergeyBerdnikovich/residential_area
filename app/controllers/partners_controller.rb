class PartnersController < ApplicationController
  # GET /partners/1
  # GET /partners/1.json
  def show
    @partner = Partner.find(params[:id])
    location = Location.find_by_partner_id(@partner)
    @json = location.to_gmaps4rails if location

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @partner }
    end
  end
end
