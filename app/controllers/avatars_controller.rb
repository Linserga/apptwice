class AvatarsController < ApplicationController

	before_action :authenticate!
	before_action :user

	def edit	

	end

	def update
		if params[:profile].present?
			if user.profile.update_attributes avatar_params
				flash[:success] = 'File uploaded successfully'
			else
				flash[:error] = 'Something went wrong with the upload'
			end
		else
			flash[:error] = 'No file provided'
		end

		redirect_to edit_avatar_path(user)
	end

	def destroy
		if user.profile.avatar?
			user.profile.avatar = nil
			user.profile.save
			flash[:success] = 'File deleted successfully'
		else
			flash[:success] = 'There was no avatar to delete'
		end

		redirect_to edit_avatar_path(user)
	end

	private 

		def user
			@user ||= User.find params[:id]
			authorize! :manage, @user			
		end

		def avatar_params
			params.require(:profile).permit(:avatar)
		end
end