class PatientPhysicalsController < ApplicationController
  before_filter :get_patient
  
  # GET /physicals
  # GET /physicals.xml
  def index
    @heights = @patient.patient_visits.select {|v| v.height != ""}
    @heights.sort! {|x,y| y.visit_date <=> x.visit_date}
    
    @weights = @patient.patient_visits.select {|v| v.weight != ""}
    @weights.sort! {|x,y| y.visit_date <=> x.visit_date}
    
    @blood_pressures = @patient.patient_visits.select {|v| v.diastolic != ""}
    @blood_pressures.sort! {|x,y| y.visit_date <=> x.visit_date}
    
    @pulses = @patient.patient_visits.select {|v| v.pulse != ""}
    @pulses.sort! {|x,y| y.visit_date <=> x.visit_date}
    
    @temperatures = @patient.patient_visits.select {|v| v.temperature != ""}
    @temperatures.sort! {|x,y| y.visit_date <=> x.visit_date}
    
  
    respond_to do |format|
      format.html # index.html.erb
      # format.xml  { render :xml => @physicals }
    end
  end
  
  def height
    @visits = @patient.patient_visits.select {|v| v.height != ""}
    @visits.sort! {|y,x| y.visit_date <=> x.visit_date}
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @visits }
    end
  end

  def weight
    @visits = @patient.patient_visits.select {|v| v.weight != ""}
    @visits.sort! {|y,x| y.visit_date <=> x.visit_date}
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @visits }
    end
  end

  def blood_pressure
    @visits = @patient.patient_visits.select {|v| v.diastolic != ""}
    @visits.sort! {|y,x| y.visit_date <=> x.visit_date}
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @visits }
    end
  end
  
  def pulse
    @visits = @patient.patient_visits.select {|v| v.pulse != ""}
    @visits.sort! {|y,x| y.visit_date <=> x.visit_date}
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @visits }
    end
  end
  
  def temperature
    @visits = @patient.patient_visits.select {|v| v.temperature != ""}
    @visits.sort! {|y,x| y.visit_date <=> x.visit_date}
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @visits }
    end
  end

  # GET /physicals/1
  # GET /physicals/1.xml
  def show
    @visits = @patient.patient_visits.select {|v| v.height != ""}
    @visits.sort! {|x,y| y.visit_date <=> x.visit_date}
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @visits }
    end
  end
  
  private
  
  def get_patient
  	if params[:patient_id]
    	@patient = Patient.find(params[:patient_id])
    end
  end
end
