class PatientNotesController < ApplicationController
  before_filter :get_patient
  
  # GET /patient_notes
  # GET /patient_notes.xml
  def index
    @patient_notes = @patient.patient_notes
    @patient_notes.sort! {|y, x| x.note_date <=> y.note_date}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_notes }
    end
  end

  # GET /patient_notes/1
  # GET /patient_notes/1.xml
  def show
    @patient_note = PatientNote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient_note }
    end
  end

  # GET /patient_notes/new
  # GET /patient_notes/new.xml
  def new
    @patient_note = PatientNote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient_note }
    end
  end

  # GET /patient_notes/1/edit
  def edit
    @patient_note = PatientNote.find(params[:id])
  end

  # POST /patient_notes
  # POST /patient_notes.xml
  def create
    @patient_note = PatientNote.new(params[:patient_note])
    @patient_note.patient = @patient

    respond_to do |format|
      if @patient_note.save
        flash[:notice] = 'PatientNote was successfully created.'
        
        APP_LOGGER_LOG.info "NOTE CREATED - for PATIENT ID " + @patient_note[:patient_id].to_s + " by USER " + self.current_user[:login]
            
        format.html { redirect_to(@patient_note) }
        format.xml  { render :xml => @patient_note, :status => :created, :location => @patient_note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient_note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patient_notes/1
  # PUT /patient_notes/1.xml
  def update
    @patient_note = PatientNote.find(params[:id])

    respond_to do |format|
      if @patient_note.update_attributes(params[:patient_note])
        flash[:notice] = 'PatientNote was successfully updated.'
        
        APP_LOGGER_LOG.info "NOTE UPDATED - for PATIENT ID " + @patient_note[:patient_id].to_s + " by USER " + self.current_user[:login]
    
        format.html { redirect_to(@patient_note) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient_note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_notes/1
  # DELETE /patient_notes/1.xml
  def destroy
    @patient_note = PatientNote.find(params[:id])
    @patient_note.destroy

    APP_LOGGER_LOG.info "NOTE DELETED - for PATIENT ID " + @patient_note[:patient_id].to_s + " by USER " + self.current_user[:login]
    
    respond_to do |format|
      format.html { redirect_to(patient_notes_url) }
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
