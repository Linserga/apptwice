class UserSession
	def initialize request, user_finder = nil
		@request = request
		@user_finder = user_finder || User
	end

	def start_session user
		@request.session[:user_id] = user.id
	end

	def destroy_session 
		@request.session[:user_id] = nil if @request
		@current_user = nil
	end

	def current_user
		session_id = @request.session[:user_id]
		@current_user ||= session_id && @user_finder.where(id: session_id).first
	end
end