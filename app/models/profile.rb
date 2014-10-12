class Profile < ActiveRecord::Base

	has_attached_file :avatar, default_url: 'default-avatar.png'
	do_not_validate_attachment_file_type :avatar
	belongs_to :user

	validates :name, presence: true
	validates :age, numericality: {only_integer: true}, allow_nil: true
end
