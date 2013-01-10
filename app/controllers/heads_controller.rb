class HeadsController < ApplicationController
  # GET /heads/1
  # GET /heads/1.json
  def show
    @head = Head.find(params[:id])
    location = Location.find_by_head_id(@head)
    @json = location.to_gmaps4rails if location

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @head }
    end
  end
end