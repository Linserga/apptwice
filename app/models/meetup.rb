class Meetup < ActiveRecord::Base

	has_and_belongs_to_many :users, through: :meetups_users
end
