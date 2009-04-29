class PatientAllergiesController < ApplicationController
  before_filter :get_patient, :except => [:find, :create]

  # GET /patient_allergies
  # GET /patient_allergies.xml
  def index
  	if (params[:patient_id])
    	@patient_allergies = @patient.patient_allergies
    	@patient_allergies.sort! {|y, x| x.date_observed <=> y.date_observed}
    else
    	@patient_allergies = PatientAllergy.find(:all, :order => "date_observed DESC")
    end 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_allergies }
    end
  end

  def find
    @patient_allergies = PatientAllergy.find(:all, :conditions => ["allergy_id = ?", params[:search]], 
    						:order => "date_observed DESC")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_allergies }
    end
  end

  # GET /patient_allergies/1
  # GET /patient_allergies/1.xml
  def show
    @patient_allergy = PatientAllergy.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient_allergy }
    end
  end

  # GET /patient_allergies/new
  # GET /patient_allergies/new.xml
  def new
    @patient_allergy = PatientAllergy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient_allergy }
    end
  end

  # GET /patient_allergies/1/edit
  def edit
    @patient_allergy = PatientAllergy.find(params[:id])
  end

  # POST /patient_allergies
  # POST /patient_allergies.xml
  def create
	name = params["patient_allergy"].delete("name")
	patient = params["patient_allergy"].delete("patient_id")
    @patient_allergy = PatientAllergy.new(params[:patient_allergy])
	allergy = Allergy.find_by_name(name)
	if !allergy
		allergy = Allergy.new(:name => name)
	end
    @patient_allergy.allergy = allergy
	@patient_allergy.patient = Patient.find(patient)
    respond_to do |format|
      if @patient_allergy.save
        flash[:notice] = "The patient's allergy was successfully created."
        
        APP_LOGGER_LOG.info "ALLERGY CREATED - for PATIENT ID " + @patient_allergy[:patient_id].to_s + " by USER " + self.current_user[:login]
            
        format.html { redirect_to(patient_patient_allergies_path(@patient)) }
        format.xml  { render :xml => @patient_allergy, :status => :created, :location => @patient_allergy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient_allergy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patient_allergies/1
  # PUT /patient_allergies/1.xml
  def update
    @patient_allergy = PatientAllergy.find(params[:id])

    respond_to do |format|
      if @patient_allergy.update_attributes(params[:patient_allergy])
        flash[:notice] = "The patient's allergy was successfully updated."
        
        APP_LOGGER_LOG.info "ALLERGY UPDATED - for PATIENT ID " + @patient_allergy[:patient_id].to_s + " by USER " + self.current_user[:login]
            
        format.html { redirect_to(patient_patient_allergies_path(@patient)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient_allergy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_allergies/1
  # DELETE /patient_allergies/1.xml
  def destroy
    @patient_allergy = PatientAllergy.find(params[:id])
    @patient_allergy.destroy
    
    APP_LOGGER_LOG.info "ALLERGY DELETED - for PATIENT ID " + @patient_allergy[:patient_id].to_s + " by USER " + self.current_user[:login]
        
    respond_to do |format|
      format.html { redirect_to(patient_patient_allergies_path(@patient)) }
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
