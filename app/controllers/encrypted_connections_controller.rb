class EncryptedConnectionsController < ApplicationController
  # GET /encrypted_connections
  # GET /encrypted_connections.json
  def index
    @encrypted_connections = EncryptedConnection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @encrypted_connections }
    end
  end

  # GET /encrypted_connections/1
  # GET /encrypted_connections/1.json
  def show
    @encrypted_connection = EncryptedConnection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @encrypted_connection }
    end
  end

  # GET /encrypted_connections/new
  # GET /encrypted_connections/new.json
  def new
    @encrypted_connection = EncryptedConnection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @encrypted_connection }
    end
  end

  # GET /encrypted_connections/1/edit
  def edit
    @encrypted_connection = EncryptedConnection.find(params[:id])
  end

  # POST /encrypted_connections
  # POST /encrypted_connections.json
  def create
    @encrypted_connection = EncryptedConnection.new(params[:encrypted_connection])

    respond_to do |format|
      if @encrypted_connection.save
        format.html { redirect_to @encrypted_connection, :notice => 'Encrypted connection was successfully created.' }
        format.json { render :json => @encrypted_connection, :status => :created, :location => @encrypted_connection }
      else
        format.html { render :action => "new" }
        format.json { render :json => @encrypted_connection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /encrypted_connections/1
  # PUT /encrypted_connections/1.json
  def update
    @encrypted_connection = EncryptedConnection.find(params[:id])

    respond_to do |format|
      if @encrypted_connection.update_attributes(params[:encrypted_connection])
        format.html { redirect_to @encrypted_connection, :notice => 'Encrypted connection was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @encrypted_connection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /encrypted_connections/1
  # DELETE /encrypted_connections/1.json
  def destroy
    @encrypted_connection = EncryptedConnection.find(params[:id])
    @encrypted_connection.destroy

    respond_to do |format|
      format.html { redirect_to encrypted_connections_url }
      format.json { head :ok }
    end
  end
end
