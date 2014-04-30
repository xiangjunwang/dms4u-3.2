class AccountsController < ApplicationController

	layout 'admin'
	before_filter :markMenuItem

	def index
		list
	end

	def list
		if params[:user_id].nil?
			@accounts = Account.sorted
		else
			@accounts = Account.sorted.where(:user_id => params[:user_id])
		end
	end

	def new
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

end
