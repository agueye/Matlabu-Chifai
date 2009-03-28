# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Can't verify a session when creating a new user
  skip_before_filter :login_required
  # Fix this later with js auth token in flex.html.erb
  skip_before_filter :verify_authenticity_token
  
  
  # Be sure to include AuthenticationSystem in Application Controller instead
  #include AuthenticatedSystem

  # GET /session/new
  # GET /session/new.xml
  # render new.rhtml
  def new
  end

  def create
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      respond_to do |format|
        format.html do
          redirect_back_or_default('/')
          flash[:notice] = "Logged in successfully"
        end
        format.xml { render :xml => self.current_user.to_xml }
      end
    else
      respond_to do |format|
        format.html { render :action => 'new' }
        format.xml { render :text => 'badlogin' }
      end
    end
  end

  # DELETE /session
  # DELETE /session.xml
  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
end
