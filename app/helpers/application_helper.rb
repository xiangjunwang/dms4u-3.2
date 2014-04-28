module ApplicationHelper
	def show_field_error(model, field)
		s=""

		if !model.errors[field].empty?
			s =
			<<-EOHTML
				<div class="error_message">
				 	#{model.errors[field][0]}
				</div>
			EOHTML
		end

		s.html_safe
	end

	private

	def clear_password_reset(user)
		user.password_expires_after = nil
		user.password_reset_token = nil
	end

	def verify_new_password(passwords)
		result = true

		if passwords[:new_password].blank? || (passwords[:new_password] != passwords[:new_password_confirmation])
			result = false
		end

		result
	end
end
