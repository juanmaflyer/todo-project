# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found 
  # layout => "application"
	
	
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  helper_method :current_user
  
  private
  
  def current_user_session
	return @current_user_session if defined?(@current_user_session)
	@current_user_session = UserSession.find
  end
  
  def current_user
	return @current_user if defined?(@current_user)
	@current_user = current_user_session && current_user_session.record
  end
  
  def record_not_found 
		render :text => "404 Not Found (No se encontro el objeto solicitado en la base de datos)", :status => 404 
  end 
  
end
