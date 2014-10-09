require 'bcrypt'

class UserAuthenticator 
	
	def initialize user
		@user = user
	end

	def authenticate password
		hash = @user && BCrypt::Password.new(@user.password_digest)
		
		if hash && hash == password
			@user
		else
			false
		end		
	end
end
