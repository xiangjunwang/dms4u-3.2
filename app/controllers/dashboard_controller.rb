class DashboardController < ApplicationController

	layout 'admin'

	def index
		# User to set menu item active
		@nav_id = 'nav-dashboard'
	end
end
