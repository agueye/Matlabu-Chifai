class ConditionsController < ApplicationController
  # GET /conditions
  # GET /conditions.xml
  def index    
    @conditions = Condition.find(:all)
    @conditions.sort! {|x, y| x.name <=> y.name}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @conditions }
    end
  end

  # GET /conditions/1
  # GET /conditions/1.xml
  def show
    @condition = Condition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @condition }
    end
  end

  # GET /conditions/new
  # GET /conditions/new.xml
  def new
    @condition = Condition.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @condition }
    end
  end

  # GET /conditions/1/edit
  def edit
    @condition = Condition.find(params[:id])
  end

  # POST /conditions
  # POST /conditions.xml
  def create
    @condition = Condition.new(params[:condition])  
    respond_to do |format|
      if @condition.save
        flash[:notice] = 'Condition was successfully created.'
        
        APP_LOGGER_LOG.info "CONDITION CREATED - " + @condition[:name] + " by USER " + self.current_user[:login]
        format.html { redirect_to(@condition) }
        format.xml  { render :xml => @condition, :status => :created, :location => @condition }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @condition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /conditions/1
  # PUT /conditions/1.xml
  def update
    @condition = Condition.find(params[:id])
    respond_to do |format|
      if @condition.update_attributes(params[:condition])
        flash[:notice] = 'Condition was successfully updated.'
        
        APP_LOGGER_LOG.info "CONDITION UPDATED - " + @condition[:name] + " by USER " + self.current_user[:login]
        
        format.html { redirect_to(@condition) }
        format.xml  { render :xml => @condition}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @condition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /conditions/1
  # DELETE /conditions/1.xml
  def destroy
    @condition = Condition.find(params[:id])
    @condition.destroy
    
    APP_LOGGER_LOG.info "CONDITION DELETED - " + @condition[:name] + " by USER " + self.current_user[:login]

    respond_to do |format|
      format.html { redirect_to(conditions_url) }
      format.xml  { head :ok }
    end
  end
end
