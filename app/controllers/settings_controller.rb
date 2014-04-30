class SettingsController < ApplicationController
	
	layout 'admin'

	before_filter :markMenuItem

	def index
		unit
	end

	def role
		@setting_nav_id = 'role'
		@roles = Role.all
	end

	def new_role
		@setting_nav_id = 'role'
		@role = Role.find_by_id(params[:id])
	end

	def register_role
		role = Role.new(params[:role])
		if role.valid?
			role.save
			flash[:setting_notice] = 'A new role created successfully.'
			redirect_to :action => 'role'
		else
			flash[:setting_error] = 'Role Creating failed.'
			@role = Role.find_by_id(params[:id])
			render 'new_role'
		end
	end

	def edit_role
		@setting_nav_id = 'role'
		@role = Role.find_by_id(params[:id])
	end

	def update_role
		role = Role.find_by_id(params[:id])
		if role.update_attributes(params[:role])
			flash[:setting_notice] = 'A role updated successfully.'
			redirect_to :action => 'role'
		else
			flash[:setting_error] = 'Role updating failed.'
			@role = Role.find_by_id(params[:id])
			render 'edit_role'
		end
	end

	def delete_role
		@setting_nav_id = 'role'
		@role = Role.find_by_id(params[:id])
	end

	def destroy_role
		@setting_nav_id = 'role'
		role = Role.find_by_id(params[:id])
		if role.destroy
			flash[:setting_notice] = 'A role deleted successfully.'
			redirect_to :action => 'role'
		else
			flash[:setting_error] = 'Role deleting failed.'
			render 'edit_role'
		end
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
		unit = Unit.find_by_id(params[:id])
		if unit.update_attributes(params[:unit])
			flash[:setting_notice] = 'An unit updated successfully.'
			redirect_to :action => 'unit'
		else
			flash[:setting_error] = 'Unit updating failed.'
			render 'edit_unit'
		end
	end

	def delete_unit
		@setting_nav_id = 'unit'
		@unit = Unit.find_by_id(params[:id])
	end

	def destroy_unit
		@setting_nav_id = 'unit'
		unit = Unit.find_by_id(params[:id])
		if unit.destroy
			flash[:setting_notice] = 'An unit deleted successfully.'
			redirect_to :action => 'unit'
		else
			flash[:setting_error] = 'Unit deleting failed.'
			render 'delete_unit'
		end
	end

	def position
		@setting_nav_id = 'position'
		@positions = Position.all
	end

	def new_position
		@setting_nav_id = 'position'
		@position = Position.find_by_id(params[:id])
	end

	def register_position
		position = Position.new(params[:position])
		if position.valid?
			position.save
			flash[:setting_notice] = 'A new position created successfully.'
			redirect_to :action => 'position'
		else
			flash[:setting_error] = 'Position Creating failed.'
			@position = Position.find_by_id(params[:id])
			render 'new_position'
		end
	end

	def edit_position
		@setting_nav_id = 'position'
		@position = Position.find_by_id(params[:id])
	end

	def update_position
		position = Position.find_by_id(params[:id])
		if position.update_attributes(params[:position])
			flash[:setting_notice] = 'A position updated successfully.'
			redirect_to :action => 'position'
		else
			flash[:setting_error] = 'Position updating failed.'
			@position = Position.find_by_id(params[:id])
			render 'edit_position'
		end
	end

	def delete_position
		@setting_nav_id = 'position'
		@position = Position.find_by_id(params[:id])
	end

	def destroy_position
		@setting_nav_id = 'position'
		position = Position.find_by_id(params[:id])
		if position.destroy
			flash[:setting_notice] = 'A position deleted successfully.'
			redirect_to :action => 'position'
		else
			flash[:setting_error] = 'Position deleting failed.'
			render 'delete_position'
		end
	end

	def plan
		@setting_nav_id = 'plan'
		@plans = Plan.all
	end

	def new_plan
		@setting_nav_id = 'plan'
		@plan = Plan.new
	end


	def register_plan
		plan = Plan.new(params[:plan])
		if plan.valid?
			plan.save
			flash[:setting_notice] = 'A new plan created successfully.'
			redirect_to :action => 'plan'
		else
			flash[:setting_error] = 'Plan Creating failed.'
			@plan = Plan.find_by_id(params[:id])
			render 'new_plan'
		end
	end

	def edit_plan
		@setting_nav_id = 'plan'
		@plan = Plan.find_by_id(params[:id])
	end

	def update_plan
		plan = Plan.find_by_id(params[:id])
		if plan.update_attributes(params[:plan])
			flash[:setting_notice] = 'A plan updated successfully.'
			redirect_to :action => 'plan'
		else
			flash[:setting_error] = 'Plan updating failed.'
			@plan = Plan.find_by_id(params[:id])
			render 'edit_plan'
		end
	end

	def delete_plan
		@setting_nav_id = 'plan'
		@plan = Plan.find_by_id(params[:id])
	end

	def destroy_plan
		@setting_nav_id = 'plan'
		plan = Plan.find_by_id(params[:id])
		if plan.destroy
			flash[:setting_notice] = 'A plan deleted successfully.'
			redirect_to :action => 'plan'
		else
			flash[:setting_error] = 'Plan deleting failed.'
			render 'delete_plan'
		end
	end


	def status
		@setting_nav_id = 'status'
		@statuses = Status.all
	end

	def new_status
		@setting_nav_id = 'status'
		@status = Status.new
	end


	def register_status
		status = Status.new(params[:status])
		if status.valid?
			status.save
			flash[:setting_notice] = 'A new status created successfully.'
			redirect_to :action => 'status'
		else
			flash[:setting_error] = 'Status Creating failed.'
			@status = Status.find_by_id(params[:id])
			render 'new_status'
		end
	end

	def edit_status
		@setting_nav_id = 'status'
		@status = Status.find_by_id(params[:id])
	end

	def update_status
		status = Status.find_by_id(params[:id])
		if status.update_attributes(params[:status])
			flash[:setting_notice] = 'A status updated successfully.'
			redirect_to :action => 'status'
		else
			flash[:setting_error] = 'Status updating failed.'
			@status = Status.find_by_id(params[:id])
			render 'edit_status'
		end
	end

	def delete_status
		@setting_nav_id = 'status'
		@status = Status.find_by_id(params[:id])
	end

	def destroy_status
		@setting_nav_id = 'status'
		status = Status.find_by_id(params[:id])
		if status.destroy
			flash[:setting_notice] = 'A status deleted successfully.'
			redirect_to :action => 'status'
		else
			flash[:setting_error] = 'Status deleting failed.'
			render 'delete_status'
		end
	end

	def country
		@setting_nav_id = 'country'
		@countries = Country.all
	end

	def new_country
		@setting_nav_id = 'country'
		@country = Country.find_by_id(params[:id])
	end

	def register_country
		country = Country.new(params[:country])
		if country.valid?
			country.save
			flash[:setting_notice] = 'A country created successfully.'
			redirect_to :action => 'country'
		else
			@country = Country.find_by_id(params[:id])
			flash[:setting_error] = 'Country creation failed.'
			render 'new'
		end
	end

	def edit_country
		@setting_nav_id = 'country'
		@country = Country.find_by_id(params[:id])
	end

	def update_country
		country = Country.find_by_id(params[:id])
		if country.update_attributes(params[:country])
			flash[:setting_notice] = 'A country updated successfully.'
			redirect_to :action => 'country'
		else
			flash[:setting_error] = 'Country updating failed.'
			@country = Country.find_by_id(params[:id])
			render 'edit_country'
		end
	end

	def delete_country
		@setting_nav_id = 'country'
		@country = Country.find_by_id(params[:id])
	end

	def destroy_country
		@setting_nav_id = 'country'
		country = Country.find_by_id(params[:id])
		if country.destroy
			flash[:setting_notice] = 'A country deleted successfully.'
			redirect_to :action => 'country'
		else
			flash[:setting_error] = 'Country deleting failed.'
			render 'delete_country'
		end
	end

	private
		def markMenuItem
			# User to set menu item active
			@nav_id = 'nav-settings'
		end
end
