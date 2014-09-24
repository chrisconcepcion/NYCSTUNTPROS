def set_current_user(a_user = nil)
	if a_user == nil
		a_user = Fabricate(:user)
	end
	cookies[:auth_token] = a_user.auth_token
end

def current_user
	if cookies[:auth_token] == nil
		set_current_user
		User.find_by(auth_token: cookies[:auth_token])
	else
		User.find_by(auth_token: cookies[:auth_token])
	end
end

def set_user_with_valid_reset_password_token
	user = Fabricate(:user, reset_password_token: "testing", reset_password_sent_at: 1.hour.ago)
	set_current_user(user)
end