class User < ActiveRecord::Base
	before_save :hash_password

	validates :email, presence: true, uniqueness: true
	validates :password, confirmation: true, presence: { on: :create}
	

	has_and_belongs_to_many :meetups, through: :meetups_users
	has_one :profile, dependent: :destroy

	delegate :name, to: :profile, allow_nil: true
	delegate :age, to: :profile, allow_nil: true

	def hash_password
		if password_changed?
			write_attribute(:password, BCrypt::Password.create(password))
		end
	end

	def rsvp_for_meetup(meetup)
		meetups << meetup unless rsvped_for_meetup?(meetup)
	end

	def cancel_rsvp_for_meetup(meetup)
		meetups.delete(meetup) if rsvped_for_meetup?(meetup)
	end

	def rsvped_for_meetup? (meetup)
		meetups.include?(meetup)
	end
end
