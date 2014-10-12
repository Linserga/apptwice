class ContactController < ApplicationController
	
	before_action :authenticate!

	def new

	end

	def create
		if params[:contact][:subject] && params[:contact][:message]
			ContactMailer.contact_admin(current_user, params[:contact]).deliver
		end

		flash[:success] = "Message sent successfully"
		redirect_to contact_path
	end
end