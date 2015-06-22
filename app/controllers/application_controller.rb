class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #before_filter :authenticate_user!
  #before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  
  layout :layout_by_resource

  
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  def layout_by_resource
	  if turk_signed_in?
	  	 "application"
	  else 
	  	 "unlogged"
	  end 
  end

  protected

  



end
