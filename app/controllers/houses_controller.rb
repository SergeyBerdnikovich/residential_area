class HousesController < ApplicationController
  before_filter :init_menu
  before_filter :authenticate_user!, :except => [:index, :show]

  load_and_authorize_resource
  # GET /houses
  # GET /houses.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @houses }
    end
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
    @location = Location.find_by_house_id(@house.id)
    @json = @location.to_gmaps4rails if @location
    @gallery = Gallery.get_gallery_for_house(@house.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @house }
    end
  end

  # GET /houses/new
  # GET /houses/new.json
  def new
    @house.build_location

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @house }
    end
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create
    authorize! :create, @house

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render json: @house, status: :created, location: @house }
      else
        format.html { render action: "new" }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /houses/1
  # PUT /houses/1.json
  def update
    authorize! :update, @house

    respond_to do |format|
      if @house.update_attributes(params[:house])
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    authorize! :destroy, @house
    @house.destroy

    respond_to do |format|
      format.html { redirect_to houses_url }
      format.json { head :no_content }
    end
  end
end
