class VisitTypesController < ApplicationController
  # GET /visit_types
  # GET /visit_types.xml
  def index
    @visit_types = VisitType.find(:all)
    @visit_types.sort! {|x, y| x.name <=> y.name}
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @visit_types }
    end
  end

  # GET /visit_types/1
  # GET /visit_types/1.xml
  def show
    @visit_type = VisitType.find(params[:id])  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @visit_type }
    end
  end

  # GET /visit_types/new
  # GET /visit_types/new.xml
  def new
    @visit_type = VisitType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @visit_type }
    end
  end

  # GET /visit_types/1/edit
  def edit
    @visit_type = VisitType.find(params[:id])
  end

  # POST /visit_types
  # POST /visit_types.xml
  def create
    @visit_type = VisitType.new(params[:visit_type])
    respond_to do |format|
      if @visit_type.save
        flash[:notice] = 'VisitType was successfully created.'
        
        APP_LOGGER_LOG.info "VISIT_TYPE CREATED - " + @visit_type[:name] + 
          " by USER " + self.current_user[:login]
        
        format.html { redirect_to(@visit_type) }
        format.xml  { render :xml => @visit_type, :status => :created, :location => @visit_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @visit_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /visit_types/1
  # PUT /visit_types/1.xml
  def update
    @visit_type = VisitType.find(params[:id])

    respond_to do |format|
      if @visit_type.update_attributes(params[:visit_type])
        flash[:notice] = 'VisitType was successfully updated.'
        
        APP_LOGGER_LOG.info "VISIT_TYPE UPDATED - " + @visit_type[:name] + 
          " by USER " + self.current_user[:login]
        
        format.html { redirect_to(@visit_type) }
        format.xml  { render :xml => @visit_type }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @visit_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /visit_types/1
  # DELETE /visit_types/1.xml
  def destroy
    @visit_type = VisitType.find(params[:id])
    @visit_type.destroy
    
    APP_LOGGER_LOG.info "VISIT_TYPE DELETED - " + @visit_type[:name] + 
      " by USER " + self.current_user[:login]

    respond_to do |format|
      format.html { redirect_to(visit_types_url) }
      format.xml  { head :ok }
    end
  end
end
