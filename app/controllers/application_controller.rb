class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :fetch_logged_user

  protected

  def fetch_logged_user
    begin
      @logged_user = User.find(session[:user_id]) unless session[:user_id].blank?
    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
      @logged_user = nil
      flash[:notice] = "Logged out"
    end
  end

  def authenticate
    unless @logged_user
      session[:original_uri] = request.url
      flash[:notice] = "Please log in to access this page"
      redirect_to :controller => :users, :action => :login
    end
  end

  def authorize_admin
    unless @logged_user.admin == 1
      session[:original_uri] = request.url
      flash[:notice] = "Please log in to access administrative area"
      redirect_to :controller => :users, :action => :login
    end
  end

end
