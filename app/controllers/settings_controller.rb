class SettingsController < ApplicationController
	
	layout 'admin'

	before_filter :markMenuItem

	def index
		unit
	end

	def role
		@setting_nav_id = 'role'
	end

	def unit
		@setting_nav_id = 'unit'
		@units = Unit.all
	end

	def new_unit
		@setting_nav_id = 'unit'
		@unit = Unit.new
	end

	def register_unit
		@setting_nav_id = 'unit'
		unit = Unit.new(params[:unit])
		if unit.valid?
			unit.save
			flash[:setting_notice] = 'A new unit successfully created.'
			redirect_to :action => 'unit'
		else
			flash[:setting_error] = 'Unit creation failed.'
			render 'new_unit'
		end
	end

	def edit_unit
		@setting_nav_id = 'unit'
		@unit = Unit.find_by_id(params[:id])
	end

	def update_unit
		@setting_nav_id = 'unit'
		unit = Unit.find_by_id[params[:unit][:id]]
		if unit.update_attributes(params[:unit])
			notice[:setting_notice] = 'An unit updated successfully.'
			redirect_to :action => 'unit'
		else
			notice[:setting_error] = 'Unit updating failed.'
			render 'edit_unit'
		end
	end

	def delete_unit
		@setting_nav_id = 'unit'
		@unit = Unit.find_by_id(params[:id])
	end

	def destroy_unit
		@setting_nav_id = 'unit'
		unit = Unit.find_by_id[params[:unit][:id]]
		if unit.distroy
			notice[:setting_notice] = 'An unit deleted successfully.'
			redirect_to :action => 'unit'
		else
			notice[:setting_error] = 'Unit deleting failed.'
			render 'delete_unit'
		end
	end

	def position
		@setting_nav_id = 'position'
	end

	def plan
		@setting_nav_id = 'plan'
	end

	def status
		@setting_nav_id = 'status'
	end

	private
		def markMenuItem
			# User to set menu item active
			@nav_id = 'nav-settings'
		end
end
