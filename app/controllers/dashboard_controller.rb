class DashboardController < ApplicationController

	layout 'admin'
	before_filter :markMenuItem

	def index
	end

	private
		def markMenuItem
			# User to set menu item active
			@nav_id = 'nav-dashboard'
		end
end
