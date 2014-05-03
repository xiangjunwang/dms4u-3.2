class AccountsController < ApplicationController

	layout 'admin'
	before_filter :markMenuItem
	before_filter :checkWritePermision, :only => [:edit, :delete, :new]

	def index
		list
	end

	def list
		if current_user.role.name == 'Administrator'
			if params[:user_id].nil?
				@accounts = Account.sorted
			else
				@accounts = Account.sorted.where(:user_id => params[:user_id])
			end
		else
			@accounts = Account.sorted.where(:user_id => current_user.id)			
		end
	end

	def new
		@account = Account.new
		@all_countries = Country.options_for_list
		@all_workplaces = Workplace.options_for_list
		@all_statuses = Status.options_for_list
	end

	def register
		account = Account.new(params[:account])
		if account.valid?
			current_user.accounts << account
			Country.find(params[:account][:country_id]).accounts << account
			Workplace.find(params[:account][:workplace_id]).accounts << account
			Status.find(params[:account][:status_id]).accounts << account
			account.save
			flash[:notice] = 'An account created successfully.'
			redirect_to :action => 'list'
		else
			@account = Account.new
			@all_countries = Country.options_for_list
			@all_workplaces = Workplace.options_for_list
			@all_statuses = Status.options_for_list
			flash[:error] = 'Account creation failed.'
			render 'new'
		end
	end

	def edit
	end

	def delete
	end

	private
		def markMenuItem
			# User to set menu item active
			@nav_id = 'nav-accounts'
		end

		def checkWritePermision
			unless current_user.role.name == "User"
				flash[:warning] = 'You have no write permision, so forced to redirect to this page'
				redirect_to :action => 'list'
			end
		end

end
