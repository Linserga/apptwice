class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			user_session.start_session @user
			flash[:success] = 'Logged in successfully'
			redirect_to root_path
		else
			flash.now[:error] = 'Something went wrong'
			render :new
		end
	end

	private

		def user_params
			params.require(:user).permit(:email, :password, :password_confirmation)
		end
end