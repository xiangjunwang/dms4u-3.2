class BlogsController < ApplicationController

	layout 'admin'
	before_filter :markMenuItem

	def index
		list
	end

	def list
		# User to set menu item active
		@nav_id = 'nav-blogs'
	end

	private
		def markMenuItem
			# User to set menu item active
			@nav_id = 'nav-accounts'
		end

end
