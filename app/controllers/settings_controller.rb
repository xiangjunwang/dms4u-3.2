class SettingsController < ApplicationController
	
	layout 'admin'

	before_filter :markMenuItem,:checkPermision

	def index
		unit
	end

	# Management of Role
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
	# End of Role

	# Management of Unit
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
	#  End of Unit

	# Start of Position
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
	# End of Position

	# Start of Plan
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
	# End of Plan


	# Start of Status
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
	# End of Status

	# Start of Country
		def country
			@setting_nav_id = 'country'
			@countries = Country.all
		end

		def new_country
			@setting_nav_id = 'country'
			@country = Country.new
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
	# End of Country

	# Start of Workplace
		def workplace
			@setting_nav_id = 'workplace'
			@workplaces = Workplace.all
		end

		def new_workplace
			@setting_nav_id = 'workplace'
			@workplace = Workplace.new
		end

		def register_workplace
			workplace = Workplace.new(params[:workplace])
			if workplace.valid?
				workplace.save
				flash[:setting_notice] = 'A workplace created successfully.'
				redirect_to :action => 'workplace'
			else
				@workplace = Workplace.find_by_id(params[:id])
				flash[:setting_error] = 'workplace creation failed.'
				render 'new'
			end
		end

		def edit_workplace
			@setting_nav_id = 'workplace'
			@workplace = Workplace.find_by_id(params[:id])
		end

		def update_workplace
			workplace = Workplace.find_by_id(params[:id])
			if workplace.update_attributes(params[:workplace])
				flash[:setting_notice] = 'A workplace updated successfully.'
				redirect_to :action => 'workplace'
			else
				flash[:setting_error] = 'Workplace updating failed.'
				@workplace = Workplace.find_by_id(params[:id])
				render 'edit_workplace'
			end
		end

		def delete_workplace
			@setting_nav_id = 'workplace'
			@workplace = Workplace.find_by_id(params[:id])
		end

		def destroy_workplace
			@setting_nav_id = 'workplace'
			workplace = Workplace.find_by_id(params[:id])
			if workplace.destroy
				flash[:setting_notice] = 'A workplace deleted successfully.'
				redirect_to :action => 'workplace'
			else
				flash[:setting_error] = 'Workplace deleting failed.'
				render 'delete_workplace'
			end
		end
	# End of Workplace

	# Management of Paypal account
		def paypal
			@setting_nav_id = 'paypal'
			@paypals = Paypal.all
		end

		def new_paypal
			@setting_nav_id = 'paypal'
			@all_statuses = Status.options_for_list
			@paypal = Paypal.new
		end


		def register_paypal
			paypal = Paypal.new(params[:paypal])
			if paypal.valid?
				paypal.save
				flash[:setting_notice] = 'A new paypal created successfully.'
				redirect_to :action => 'paypal'
			else
				flash[:setting_error] = 'Paypal Creating failed.'
				@paypal = Paypal.find_by_id(params[:id])
				render 'new_paypal'
			end
		end

		def edit_paypal
			@setting_nav_id = 'paypal'
			@all_statuses = Status.options_for_list
			@paypal = Paypal.find_by_id(params[:id])
		end

		def update_paypal
			paypal = Paypal.find_by_id(params[:id])
			if paypal.update_attributes(params[:paypal])
				flash[:setting_notice] = 'A paypal updated successfully.'
				redirect_to :action => 'paypal'
			else
				flash[:setting_error] = 'Paypal updating failed.'
				@paypal = Paypal.find_by_id(params[:id])
				render 'edit_paypal'
			end
		end

		def delete_paypal
			@setting_nav_id = 'paypal'
			@paypal = Paypal.find_by_id(params[:id])
		end

		def destroy_paypal
			@setting_nav_id = 'paypal'
			paypal = Paypal.find_by_id(params[:id])
			if paypal.destroy
				flash[:setting_notice] = 'A paypal deleted successfully.'
				redirect_to :action => 'paypal'
			else
				flash[:setting_error] = 'Paypal deleting failed.'
				render 'delete_paypal'
			end
		end
	# End of paypal management

	# Management of Bank account
		def bank
			@setting_nav_id = 'bank'
			@banks = Bank.all
		end

		def new_bank
			@setting_nav_id = 'bank'
			@all_statuses = Status.options_for_list
			@bank = Bank.new
		end


		def register_bank
			bank = Bank.new(params[:bank])
			if bank.valid?
				bank.save
				flash[:setting_notice] = 'A new bank created successfully.'
				redirect_to :action => 'bank'
			else
				flash[:setting_error] = 'Bank Creating failed.'
				@bank = Bank.find_by_id(params[:id])
				render 'new_bank'
			end
		end

		def edit_bank
			@setting_nav_id = 'bank'
			@all_statuses = Status.options_for_list
			@bank = Bank.find_by_id(params[:id])
		end

		def update_bank
			bank = Bank.find_by_id(params[:id])
			if bank.update_attributes(params[:bank])
				flash[:setting_notice] = 'A bank updated successfully.'
				redirect_to :action => 'bank'
			else
				flash[:setting_error] = 'Bank updating failed.'
				@bank = Bank.find_by_id(params[:id])
				render 'edit_bank'
			end
		end

		def delete_bank
			@setting_nav_id = 'bank'
			@bank = Bank.find_by_id(params[:id])
		end

		def destroy_bank
			@setting_nav_id = 'bank'
			bank = Bank.find_by_id(params[:id])
			if bank.destroy
				flash[:setting_notice] = 'A bank deleted successfully.'
				redirect_to :action => 'bank'
			else
				flash[:setting_error] = 'Bank deleting failed.'
				render 'delete_bank'
			end
		end
	# End of bank management


	# Private functions
		private
			def markMenuItem
				# User to set menu item active
				@nav_id = 'nav-settings'
			end

			def checkPermision
				unless current_user.role.name == "Administrator"
					redirect_to :controller => 'dashboard'
				end
			end
	# End of private funtions
end
