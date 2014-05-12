class AccountsController < ApplicationController

	layout 'admin'
	before_filter :markMenuItem
	before_filter :checkWritePermision, :only => [:edit, :delete, :new]
	before_filter :settingListForOptions, :only => [:edit, :new]

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
		@account = Account.find_by_id(params[:id])
	end

	def update
		account = Account.find_by_id(params[:id])
		account.username = params[:account][:username]
		account.password = params[:account][:password]
		account.email = params[:account][:email]
		account.email_password = params[:account][:email_password]
		if account.save
			Country.find(params[:account][:country_id]).accounts << account if params[:account][:country_id].to_i > 0
			Workplace.find(params[:account][:workplace_id]).accounts << account if params[:account][:workplace_id].to_i > 0
			Status.find(params[:account][:status_id]).accounts << account if params[:account][:status_id].to_i > 0
			account.save
			flash[:notice] = 'An account updated successfully.'
			redirect_to :action => 'list'
		else
			@account = Account.find_by_id(params[:id])
			flash[:error] = 'Account modification was updated successfully.'
			render 'edit'
		end
	end

	def delete
		@account = Account.find_by_id(params[:id])
	end

	def destroy
		account = Account.find_by_id(params[:id])
		if account.destroy
			flash[:notice] = 'An account deleted successfully.'
			redirect_to :action => 'list'
		else
			@account = Account.find_by_id(params[:id])
			render 'delete'
		end
	end

	private
		def markMenuItem
			# User to set menu item active
			if current_user.role.nil?
        flash[:warning] = 'Currenty you have no role. Please contact administrator.'
        redirect_to :controller => 'dashboard'
      end
			@nav_id = 'nav-accounts'
		end

		def checkWritePermision
			unless current_user.role.name == "User"
				flash[:warning] = 'You have no write permision, so forced to redirect to this page'
				redirect_to :action => 'list'
			end
		end

		def settingListForOptions
			@all_countries = Country.options_for_list
			@all_workplaces = Workplace.options_for_list
			@all_statuses = Status.options_for_list
		end

end
