class MeetupsController < ApplicationController
	
	authorize_resource only: [:new, :show, :edit, :update, :destroy]
	before_action :meetup, only: [:show, :edit, :update, :destroy]

	def index
		@meetups = Meetup.all
	end

	def new
		@meetup = Meetup.new
	end

	def create
		@meetup = Meetup.new(meetup_params)

		if @meetup.save
			flash[:success] = 'Meetup successfully created'
			redirect_to meetups_path
		else
			flash.now[:error] = 'Oops there was a problem...'
			render :new
		end
	end

	def show

	end

	def edit
	end

	def update
		if @meetup.update_attributes(meetup_params)
			flash[:success] = "Updated!"
			redirect_to @meetup
		else
			flash.now[:error] = 'Oops'
			render :edit
		end
	end

	def destroy
		if @meetup.destroy
			flash[:success] = 'Deleted!'
			redirect_to meetups_path
		end
	end

	private
		def meetup
			@meetup = Meetup.find(params[:id])
		end

		def meetup_params
			params.require(:meetup).permit(:name, :description, :address, :city, :zip, :state, :starts_at, :ends_at)
		end
end
