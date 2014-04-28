class BlogsController < ApplicationController

	layout 'admin'

	def index
		list
	end

	def list
		# User to set menu item active
		@nav_id = 'nav-blogs'
	end

end
