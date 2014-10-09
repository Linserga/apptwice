class SessionsController < ApplicationController
	

	def create
		@user = User.find_by email: params[:email]
		auth = UserAuthenticator.new @user

		if auth.authenticate params[:password]
			user_session.start_session @user
			flash[:success] = "Logged in successfully"
			redirect_to root_path
		else
			flash.now[:error] = "Invalid email or password"
			render :new
		end
	end

	def destroy
		user_session.destroy_session
		flash[:success] = 'Logged out successfully'
		redirect_to root_path
	end
end