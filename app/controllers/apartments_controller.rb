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

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @apartment }
    end
  end

  # GET /apartments/new
  # GET /apartments/new.json
  def new
    @house = House.find(params[:house_id])
    @apartment = Apartment.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @apartment }
    end
  end

  # GET /apartments/1/edit
  def edit
    @house = House.find(params[:house_id])
    @apartment = Apartment.find(params[:id])
  end

  # POST /apartments
  # POST /apartments.json
  def create
    @house = House.find(params[:house_id])
    @apartment = Apartment.new(params[:apartment])
    @house.apartments << @apartment
    respond_to do |format|
      if @apartment.save
        format.html { redirect_to house_apartments_path(@house), notice: 'Apartment was successfully created.' }
        format.json { render json: house_apartments_path(@house), status: :created, location: @apartment }
      else
        format.html { render action: "new" }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /apartments/1
  # PUT /apartments/1.json
  def update
    @house = House.find(params[:house_id])
    @apartment = Apartment.find(params[:id])

    respond_to do |format|
      if @apartment.update_attributes(params[:apartment])
        format.html { redirect_to house_apartments_path(@house), notice: 'Apartment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    @house = House.find(params[:house_id])
    @apartment = Apartment.find(params[:id])
    @apartment.destroy

    respond_to do |format|
      format.html { redirect_to house_apartments_path(@house) }
      format.json { head :no_content }
    end
  end
end
