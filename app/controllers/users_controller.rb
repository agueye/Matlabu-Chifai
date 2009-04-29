class UsersController < ApplicationController
  # Can't verify a login when creating a new user
  skip_before_filter :login_required
  
# Be sure to include AuthenticationSystem in Application Controller instead
  #include AuthenticatedSystem
  
  # GET /users/new
  # GET /users/new.xml
  # render new.rhtml
  def new
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

end