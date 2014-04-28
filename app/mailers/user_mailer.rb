class UserMailer < ActionMailer::Base
	# default :from => "from@example.com"

	def welcome_email(user)
		@user = user
		@url = "<a href='http://localhost:3000/sign_in'>http://localhost:3000/sign_in</a>"
		@site_name = "DMS4U"
		mail(:to => "alexyagjin@gmail.com", :subject => "Welcome to my website.")
	end

	def reset_password_email(user)
		@user = user
		@password_reset_url = 'http://localhost:3000/password_reset?' + @user.password_reset_token
		mail(:to => user.email, :subject => 'Password Reset Instructions.')
	end
end
