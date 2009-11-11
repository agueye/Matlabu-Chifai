class PatientAlertsController < ApplicationController
  # GET /patient_alerts
  # GET /patient_alerts.xml
  def index
    @patient_alerts = PatientAlerts.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_alerts }
    end
  end

  # GET /patient_alerts/1
  # GET /patient_alerts/1.xml
  def show
    @patient_alerts = PatientAlerts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient_alerts }
    end
  end

  # GET /patient_alerts/new
  # GET /patient_alerts/new.xml
  def new
    @patient_alerts = PatientAlerts.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient_alerts }
    end
  end

  # GET /patient_alerts/1/edit
  def edit
    @patient_alerts = PatientAlerts.find(params[:id])
  end

  # POST /patient_alerts
  # POST /patient_alerts.xml
  def create
    @patient_alerts = PatientAlerts.new(params[:patient_alerts])

    respond_to do |format|
      if @patient_alerts.save
        flash[:notice] = 'PatientAlerts was successfully created.'
        format.html { redirect_to(@patient_alerts) }
        format.xml  { render :xml => @patient_alerts, :status => :created, :location => @patient_alerts }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient_alerts.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patient_alerts/1
  # PUT /patient_alerts/1.xml
  def update
    @patient_alerts = PatientAlerts.find(params[:id])

    respond_to do |format|
      if @patient_alerts.update_attributes(params[:patient_alerts])
        flash[:notice] = 'PatientAlerts was successfully updated.'
        format.html { redirect_to(@patient_alerts) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient_alerts.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_alerts/1
  # DELETE /patient_alerts/1.xml
  def destroy
    @patient_alerts = PatientAlerts.find(params[:id])
    @patient_alerts.destroy

    respond_to do |format|
      format.html { redirect_to(patient_alerts_url) }
      format.xml  { head :ok }
    end
  end
end
