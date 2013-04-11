class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_authenticated
  	redirect_to new_session_path, :alert => "Please login to make a pledge."
  end
end
