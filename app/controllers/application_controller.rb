class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  serialization_scope :view_context


  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  
end
