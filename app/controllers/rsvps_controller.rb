class RsvpsController < ApplicationController

	before_action :meetup, :authenticate!

	def create
		if current_user.rsvp_for_meetup(meetup)
			message = "You've RSVPed successfully"
		else
			message = "You've already RSVPed for this meetup"
		end

		flash[:success] = message
		redirect_to :back
	end

	def destroy
		if current_user.cancel_rsvp_for_meetup(meetup)
			message = "You've canceled your RSVP successfully"
		else
			message = "You haven't RSVPed for this meetup"
		end

		flash[:success] = message
		redirect_to :back

	end

	def meetup
		@meetup ||= Meetup.find params[:meetup_id]
	end

end