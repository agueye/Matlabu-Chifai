class UsersController < ApplicationController
  
# Be sure to include AuthenticationSystem in Application Controller instead
  #include AuthenticatedSystem
  
  # GET /users/new
  # GET /users/new.xml
  # render new.rhtml
  def new
  end

  # GET /users
  # GET /users.xml
  def index
    @users = User.find(:all)
    @users.sort! {|x, y| x.login <=> y.login}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save!
    
    APP_LOGGER_LOG.info "USER CREATED - " + @user[:login]

    self.current_user = @user
    respond_to do |format|
      format.html do
        redirect_back_or_default('/')
        flash[:notice] = "Thanks for singing up!"
      end
      format.xml { render :xml => @user.to_xml }
    end
  rescue ActiveRecord::RecordInvalid
    respond_to do |format|
      format.html { render :action => 'new' }
      format.xml { render :text => "error" }
    end
    
  end
  
  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    APP_LOGGER_LOG.info "USER DELETED - " + @user[:login] + " by USER " + self.current_user[:login]
        
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

end