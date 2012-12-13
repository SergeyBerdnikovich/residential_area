class HeadsController < ApplicationController
  # GET /heads
  # GET /heads.json
  def index
    @heads = Head.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @heads }
    end
  end

  # GET /heads/1
  # GET /heads/1.json
  def show
    @head = Head.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @head }
    end
  end

  # GET /heads/new
  # GET /heads/new.json
  def new
    @head = Head.new
    @head.phone_numbers.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @head }
    end
  end

  # GET /heads/1/edit
  def edit
    @head = Head.find(params[:id])
  end

  # POST /heads
  # POST /heads.json
  def create
    @head = Head.new(params[:head])

    respond_to do |format|
      if @head.save
        format.html { redirect_to @head, notice: 'Head was successfully created.' }
        format.json { render json: @head, status: :created, location: @head }
      else
        format.html { render action: "new" }
        format.json { render json: @head.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /heads/1
  # PUT /heads/1.json
  def update
    @head = Head.find(params[:id])

    respond_to do |format|
      if @head.update_attributes(params[:head])
        format.html { redirect_to @head, notice: 'Head was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @head.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heads/1
  # DELETE /heads/1.json
  def destroy
    @head = Head.find(params[:id])
    @head.destroy

    respond_to do |format|
      format.html { redirect_to heads_url }
      format.json { head :no_content }
    end
  end
end
