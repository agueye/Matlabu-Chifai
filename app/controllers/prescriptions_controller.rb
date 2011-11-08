class PrescriptionsController < ApplicationController
  # GET /prescriptions
  # GET /prescriptions.json
  def index
    @prescriptions = Prescription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prescriptions }
    end
  end

  # GET /prescriptions/1
  # GET /prescriptions/1.json
  def show
    @prescription = Prescription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prescription }
    end
  end

  # GET /prescriptions/new
  # GET /prescriptions/new.json
  def new
    @prescription = Prescription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prescription }
    end
  end

  # GET /prescriptions/1/edit
  def edit
    @prescription = Prescription.find(params[:id])
  end

  # POST /prescriptions
  # POST /prescriptions.json
  def create
    @prescription = Prescription.new(params[:prescription])

    respond_to do |format|
      if @prescription.save
        format.html { redirect_to @prescription, notice: 'Prescription was successfully created.' }
        format.json { render json: @prescription, status: :created, location: @prescription }
      else
        format.html { render action: "new" }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prescriptions/1
  # PUT /prescriptions/1.json
  def update
    @prescription = Prescription.find(params[:id])

    respond_to do |format|
      if @prescription.update_attributes(params[:prescription])
        format.html { redirect_to @prescription, notice: 'Prescription was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prescriptions/1
  # DELETE /prescriptions/1.json
  def destroy
    @prescription = Prescription.find(params[:id])
    @prescription.destroy

    respond_to do |format|
      format.html { redirect_to prescriptions_url }
      format.json { head :ok }
    end
  end
end
