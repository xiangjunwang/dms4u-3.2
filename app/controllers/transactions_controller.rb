class TransactionsController < ApplicationController

	layout 'admin'
	before_filter :markMenuItem
	before_filter :checkWritePermision, :only => [:edit, :delete, :new]

	def list
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
			@nav_id = 'nav-transactions'
		end

		def checkWritePermision
			unless current_user.role.name == "User"
				flash[:warning] = 'You have no write permision, so forced to redirect to this page'
				redirect_to :action => 'list'
			end
		end
end
