class UpdateUser
	attr_reader :error_message
	def initialize(user, update_hash)
		@user = user
		@password = update_hash[:password] 
		@password_confirmation = update_hash[:password_confirmation]
		@first_name = update_hash[:first_name]
		@middle_name = update_hash[:middle_name]
		@last_name = update_hash[:last_name]
		@email = update_hash[:email] 
		@gender = update_hash[:gender] 
		@roles = update_hash[:roles]
	end
	
	def update_user
		update_password = password_validation(@password, @password_confirmation)
		@user.attributes = { first_name: @first_name, middle_name: @middle_name, last_name: @last_name, email: @email, gender: @gender, roles: @roles }
		if update_password == "error" || !@user.valid?
			@status = :failed
			@error_message = "Please check the form for errors."
			self
		else
			if update_password && @user.save!(first_name: @first_name, middle_name: @middle_name, last_name: @last_name, email: @email, gender: @gender, roles: @roles)
				@user.update_password(@password, @password_confirmation)
				@status = :success
				self
			elsif !update_password && @user.save!(first_name: @first_name, middle_name: @middle_name, last_name: @last_name, email: @email, gender: @gender, roles: @roles)
				@status = :success
				self
			end
		end
	end
	
	def password_validation(password, password_confirmation)
		if (password.blank?) && (password_confirmation.blank?)
			false
		elsif (password == password_confirmation) && (password.length >= 6)
			true
		else
			"error"
		end
	end
	
	def user_params_validation(first_name, middle_name, last_name, email, gender, roles)
		if @user.update!(first_name, middle_name, last_name, email, gender, roles)
			valid_user
		else
			invalid_user
		end
	end

	def successful?
		@status == :success
	end
	def error_message
		@error_message
	end
end			
	