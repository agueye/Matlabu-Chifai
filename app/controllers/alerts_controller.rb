class AlertsController < ApplicationController
  # GET /alerts
  # GET /alerts.json
  def index
    @alerts = Alert.all
    @alert = Alert.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @alerts }
    end
  end

  # GET /alerts/1
  # GET /alerts/1.json
  def show
    @alert = Alert.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @alert }
    end
  end

  # GET /alerts/new
  # GET /alerts/new.json
  def new
    @alert = Alert.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @alert }
    end
  end

  # GET /alerts/1/edit
  def edit
    @alert = Alert.find(params[:id])
  end

  # POST /alerts
  # POST /alerts.json
  def create
    @alert = Alert.new(params[:alert])

    respond_to do |format|
      if @alert.save
        flash.now[:notice] = 'Alert was successfully created.'
        format.html { redirect_to :alerts }
        format.json { render :json => @alert, :status => :created, :location => @alert }
        format.js
      else
        flash.now[:notice] = @alert.errors.full_messages.join "<br>"
        format.html { render :action => "index" }
        format.json { render :json => @alert.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /alerts/1
  # PUT /alerts/1.json
  def update
    @alert = Alert.find(params[:id])

    respond_to do |format|
      if @alert.update_attributes(params[:alert])
        format.html { redirect_to :alerts, :notice => 'Alert was successfully updated.' }
        format.json { respond_with_bip(@alert) }
      else
        format.html { render :action => "index" }
        format.json { respond_with_bip(@alert) }
      end
    end
  end

  # DELETE /alerts/1
  # DELETE /alerts/1.json
  def destroy
    @alert = Alert.find(params[:id])
    @alert.destroy

    respond_to do |format|
      flash.now[:notice] = 'Alert was successfully deleted.'
      format.html { render :action => "index" }
      format.json { head :ok }
      format.js { render :js => 'refresh_flash("' + flash[:notice] + '")' }
    end
  end
end