class VaccinesController < ApplicationController

  def add_condition
    @vaccine = Vaccine.find(params[:vaccine_id])
    @condition = Condition.find(params[:condition_id])
    respond_to do |format|
      if @vaccine.conditions << @condition
        format.html { redirect_to @vaccine, notice: 'Vaccine was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "show" }
        format.json { render json: @vaccine.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /vaccines
  # GET /vaccines.json
  def index
    @vaccines = Vaccine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vaccines }
    end
  end

  # GET /vaccines/1
  # GET /vaccines/1.json
  def show
    @vaccine = Vaccine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vaccine }
    end
  end

  # GET /vaccines/new
  # GET /vaccines/new.json
  def new
    @vaccine = Vaccine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vaccine }
    end
  end

  # GET /vaccines/1/edit
  def edit
    @vaccine = Vaccine.find(params[:id])
  end

  # POST /vaccines
  # POST /vaccines.json
  def create
    @vaccine = Vaccine.new(params[:vaccine])

    respond_to do |format|
      if @vaccine.save
        format.html { redirect_to @vaccine, notice: 'Vaccine was successfully created.' }
        format.json { render json: @vaccine, status: :created, location: @vaccine }
      else
        format.html { render action: "new" }
        format.json { render json: @vaccine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vaccines/1
  # PUT /vaccines/1.json
  def update
    @vaccine = Vaccine.find(params[:id])

    respond_to do |format|
      if @vaccine.update_attributes(params[:vaccine])
        format.html { redirect_to @vaccine, notice: 'Vaccine was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @vaccine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vaccines/1
  # DELETE /vaccines/1.json
  def destroy
    @vaccine = Vaccine.find(params[:id])
    @vaccine.destroy

    respond_to do |format|
      format.html { redirect_to vaccines_url }
      format.json { head :ok }
    end
  end
end
