class PatientVisitsController < ApplicationController
  # GET /patient_visits
  # GET /patient_visits.xml
  def index
    @patient_visits = PatientVisit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_visits }
    end
  end

  # GET /patient_visits/1
  # GET /patient_visits/1.xml
  def show
    @patient_visit = PatientVisit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient_visit }
    end
  end

  # GET /patient_visits/new
  # GET /patient_visits/new.xml
  def new
    @patient_visit = PatientVisit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient_visit }
    end
  end

  # GET /patient_visits/1/edit
  def edit
    @patient_visit = PatientVisit.find(params[:id])
  end

  # POST /patient_visits
  # POST /patient_visits.xml
  def create
    @patient_visit = PatientVisit.new(params[:patient_visit])

    respond_to do |format|
      if @patient_visit.save
        flash[:notice] = 'PatientVisit was successfully created.'
        format.html { redirect_to(@patient_visit) }
        format.xml  { render :xml => @patient_visit, :status => :created, :location => @patient_visit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient_visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patient_visits/1
  # PUT /patient_visits/1.xml
  def update
    @patient_visit = PatientVisit.find(params[:id])

    respond_to do |format|
      if @patient_visit.update_attributes(params[:patient_visit])
        flash[:notice] = 'PatientVisit was successfully updated.'
        format.html { redirect_to(@patient_visit) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient_visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_visits/1
  # DELETE /patient_visits/1.xml
  def destroy
    @patient_visit = PatientVisit.find(params[:id])
    @patient_visit.destroy

    respond_to do |format|
      format.html { redirect_to(patient_visits_url) }
      format.xml  { head :ok }
    end
  end
end
