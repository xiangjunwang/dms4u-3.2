class BlogsController < ApplicationController

	layout 'admin'
	before_filter :markMenuItem

	def index
		list
	end

	def list
	end

	private
		def markMenuItem
			# User to set menu item active
			@nav_id = 'nav-blogs'
		end

end
