class MedicationsController < ApplicationController
  # GET /medications
  # GET /medications.json
  def index
    @medications = Medication.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medications }
    end
  end

  # GET /medications/1
  # GET /medications/1.json
  def show
    @medication = Medication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medication }
    end
  end

  # GET /medications/new
  # GET /medications/new.json
  def new
    @medication = Medication.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medication }
    end
  end

  # GET /medications/1/edit
  def edit
    @medication = Medication.find(params[:id])
  end

  # POST /medications
  # POST /medications.json
  def create
    @medication = Medication.new(params[:medication])

    respond_to do |format|
      if @medication.save
        format.html { redirect_to @medication, notice: 'Medication was successfully created.' }
        format.json { render json: @medication, status: :created, location: @medication }
      else
        format.html { render action: "new" }
        format.json { render json: @medication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medications/1
  # PUT /medications/1.json
  def update
    @medication = Medication.find(params[:id])

    respond_to do |format|
      if @medication.update_attributes(params[:medication])
        format.html { redirect_to @medication, notice: 'Medication was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @medication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medications/1
  # DELETE /medications/1.json
  def destroy
    @medication = Medication.find(params[:id])
    @medication.destroy

    respond_to do |format|
      format.html { redirect_to medications_url }
      format.json { head :ok }
    end
  end
end
