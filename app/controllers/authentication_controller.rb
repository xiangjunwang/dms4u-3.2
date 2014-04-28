class AuthenticationController < ApplicationController

	before_filter :authenticate_user, :only => [:account_settings, :set_account_info]

	layout 'admin'

	def sign_in
		@user = User.new
	end

	def login
		username = params[:user][:username]
		password = params[:user][:password]

		user = User.authenticate_by_username(username, password)

		if user
			update_authentication_token(user, params[:user][:remember_me])
			user.save
			session[:user_id] = user.id
			flash[:notice] = 'Hi ' + user.name + ', you logged in as ' + user.username
			redirect_to :root
		else
			flash.now[:error] = 'Unknown user. Please check your username and password.'
			render :action => "sign_in"
		end

	end

	def sign_out
		user = User.find_by_id(session[:user_id])
		if user
			update_authentication_token(user, nil)
			user.save
			session[:user_id] = nil
			flash[:notice] = "You have been signed out."
			redirect_to :sign_in
		else
			redirect_to :sign_in
		end
	end

	def change_password
	end

	# Http get
	def forgot_password
		@user = User.new
	end

	# Http put
	def send_password_reset_instructions
		username = params[:user][:username]

		user = User.find_by_username(username)


		if user
			user.password_reset_token = SecureRandom.urlsafe_base64
			user.password_expires_after = 24.hours.from_now
			user.save
			UserMailer.reset_password_email(user).deliver
			flash[:notice] = 'Password instructions have been mailed to you. Please check your inbox.'
			redirect_to :sign_in
		else
			@user = User.new
			# put the previous value back.
			@user.username = params[:user][:username]
			@user.errors[:username] = 'is not a registered user.'
			render :action => "forgot_password"
		end
	end

	# HTTP get
	def password_reset
		token = params.first[0]
		@user = User.find_by_password_reset_token(token)

		if @user.nil?
			flash[:error] = 'You have not requested a password reset.'
			redirect_to :root
			return
		end

		if @user.password_expires_after < DateTime.now
			clear_password_reset(@user)
			@user.save
			flash[:error] = 'Password reset has expired. Please request a new password reset.'
			redirect_to :forgot_password
		end
	end

	# HTTP put
	def new_password
		username = params[:user][:username]
		@user = User.find_by_username(username)

		if verify_new_password(params[:user])
			@user.update_attributes(params[:user])
			@user.password = @user.new_password

			if @user.valid?
				clear_password_reset(@user)
				@user.save
				flash[:notice] = 'Your password has been reset. Please sign in with your new password.'
				redirect_to :sign_in
			else
				render :action => "password_reset"
			end
		else
			@user.errors[:new_password] = 'Cannot be blank and must match the password verification.'
			render :action => "password_reset"
		end
	end


	def new_user
		@user = User.new
	end

	def register
		@user = User.new(params[:user])

		if @user.valid?
			update_authentication_token(@user, params[:user][:remember_me])
			@user.save
			UserMailer.welcome_email(@user).deliver
			session[:user_id] = @user.id
			flash[:notice] = 'Welcome.'
			redirect_to :root
		else
			render :action => "new_user"
		end
	end

	def password_sent
	end

	def account_settings
		@user = current_user
	end

	def set_account_info
		old_user = current_user

		# verify the current password by creating a new user record.
		@user = User.authenticate_by_username(old_user.username, params[:user][:password])

		# verify
		if @user.nil?
			@user = current_user
			@user.errors[:password] = "Password is incorrect."
			render :action => "account_settings"
		else
			# update the user with any new username and name
			@user.update_attributes(params[:user])
			# Set the old email and username, which is validated only if it has changed.
			@user.previous_username = old_user.username

			if @user.valid?
			# If there is a new_password value, then we need to update the password.
				@user.password = @user.new_password unless @user.new_password.nil? || @user.new_password.empty?
				unless @user.save
					render :action => "account_settings"
				end
				flash[:notice] = 'Account settings have been changed.'
				redirect_to :root
			else
				render :action => "account_settings"
			end
		end
	end

	def authenticate_user
		if current_user.nil?
			flash[:error] = 'You must be signed in to view that page.'
			redirect_to :root
		end
	end

	def update_authentication_token(user, remember_me)
		if remember_me == 1
			# create an authentication token if the user has clicked on remember me
			auth_token = SecureRandom.urlsafe_base64
			user.authentication_token = auth_token
			cookies.permanent[:auth_token] = auth_token
		else # nil or 0
			# if not, clear the token, as the user doesn't want to be remembered.
			user.authentication_token = nil
			cookies.permanent[:auth_token] = nil
		end
	end

end
