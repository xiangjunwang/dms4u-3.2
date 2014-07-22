class UsersController < ApplicationController

	layout 'admin'

	before_filter :checkPermision

	def index
		list
	end

	def list
		# User to set menu item active
		@nav_id = 'nav-users'
		@users = User.all
	end

	def new
		@user = User.new
		@all_units = Unit.options_for_list
		@all_roles = Role.options_for_list
		@all_positions = Position.options_for_list
	end

	def register
		user = User.new(:name => params[:user][:name],
						:username => params[:user][:username],
						:username => params[:user][:username],
						:birthday => params[:user][:birthday],
						:password => params[:user][:password])
		if user.valid?
			user.save
			Position.find_by_id(params[:user][:position_id]).users << user
			Role.find_by_id(params[:user][:role_id]).users << user
			Unit.find_by_id(params[:user][:unit_id]).users << user
			flash[:notice] = 'An user created successfully.'
			redirect_to :action => 'list'
		else
			flash[:error] = 'Registration failed.'
			@user = User.new
			@all_units = Unit.options_for_list
			@all_roles = Role.options_for_list
			@all_positions = Position.options_for_list
			render 'new'
		end
	end

	def edit
		@user = User.find_by_id(params[:id])
		@all_units = Unit.options_for_list
		@all_roles = Role.options_for_list
		@all_positions = Position.options_for_list
	end

	def update
		user = User.find_by_id(params[:id])
		user.update_attributes( :name => params[:user][:name],
								:username => params[:user][:username],
								:email => params[:user][:email],
								:birthday => params[:user][:birthday],
								:password => params[:user][:password])
		if user.valid?
			Position.find_by_id(params[:user][:position_id]).users << user
			Role.find_by_id(params[:user][:role_id]).users << user
			Unit.find_by_id(params[:user][:unit_id]).users << user
			flash[:notice] = 'An user updated successfully.'
			redirect_to :action => 'list'
		else
			@user = User.find_by_id(params[:id])
			@all_units = Unit.options_for_list
			@all_roles = Role.options_for_list
			@all_positions = Position.options_for_list
			flash[:error] = 'Updating failed.'
			render 'edit'
		end
	end

	def delete_user
		@user = User.find_by_id(params[:id])

	end

	def destroy_user
	end

	private
		def markMenuItem
			# User to set menu item active
			@nav_id = 'nav-accounts'
		end

		def checkPermision
			unless current_user.role.name == "Administrator"
				redirect_to :controller => 'dashboard'
			end
		end
end
