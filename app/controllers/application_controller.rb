class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private 
  	def current_user
  		@current_user ||= user_session.current_user
  	end

  	def user_session
  		@user_session ||= UserSession.new(request)
  	end

    def authenticate!
      redirect_to login_path unless current_user #raise ActionController::RoutingError.new('Not Found') 
    end
end
