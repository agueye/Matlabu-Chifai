class PatientAlertsController < ApplicationController
  before_filter :get_patient
  
  # GET /patient_alerts
  # GET /patient_alerts.xml
  def index
    if params[:patient_id]
    	@patient_alerts = @patient.patient_alerts
    	@patient_alerts.sort! {|y, x| x.alert_date <=> y.alert_date} 
    else
    	@patient_alerts = PatientAlert.find(:all, :order => "alert_date")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_alerts }
    end
  end

  # GET /patient_alerts/1
  # GET /patient_alerts/1.xml
  def show
    @patient_alert = PatientAlert.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient_alert }
    end
  end

  # GET /patient_alerts/new
  # GET /patient_alerts/new.xml
  def new
    @patient_alert = PatientAlert.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient_alert }
    end
  end

  # GET /patient_alerts/1/edit
  def edit
    @patient_alert = PatientAlert.find(params[:id])
  end

  # POST /patient_alerts
  # POST /patient_alerts.xml
  def create
    @patient_alert = PatientAlert.new(params[:patient_alert])
    @patient_alert.patient = @patient
	
    respond_to do |format|
      if @patient_alert.save
        flash[:notice] = 'PatientAlert was successfully created.'
        format.html { redirect_to(@patient_alert) }
        format.xml  { render :xml => @patient_alert, :status => :created, :location => @patient_alert }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient_alert.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patient_alerts/1
  # PUT /patient_alerts/1.xml
  def update
    @patient_alert = PatientAlert.find(params[:id])

    respond_to do |format|
      if @patient_alert.update_attributes(params[:patient_alert])
        flash[:notice] = 'PatientAlert was successfully updated.'
        format.html { redirect_to(@patient_alert) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient_alert.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_alerts/1
  # DELETE /patient_alerts/1.xml
  def destroy
    @patient_alert = PatientAlert.find(params[:id])
    @patient_alert.destroy

    respond_to do |format|
      format.html { redirect_to(patient_alerts_url) }
      format.xml  { head :ok }
    end
  end

private
	def get_patient
		if (params[:patient_id])
			@patient = Patient.find(params[:patient_id])
		end
	end 
end
