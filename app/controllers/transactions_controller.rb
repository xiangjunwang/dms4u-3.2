class TransactionsController < ApplicationController

	layout 'admin'
	before_filter :markMenuItem, :checkAuthentication, :validation
	before_filter :checkWritePermision, :only => [:edit, :delete, :new]

	def index
		list
	end

	def list
		today = Date.today
		@start_date = (params[:start_date].nil?) ? today.at_beginning_of_week : params[:start_date]
		@end_date = (params[:end_date].nil?) ? today.at_end_of_week : params[:end_date]

		if current_user.role.name == 'Administrator'
			@wp_transactions = WpTransaction.proceeded_between(@start_date, @end_date)
			@bank_transactions = BankTransaction.proceeded_between(@start_date, @end_date)
			@paypal_transactions = PaypalTransaction.proceeded_between(@start_date, @end_date)
		else
			@wp_transactions = WpTransaction.proceeded_between_by_a_user(current_user, @start_date, @end_date)
			@bank_transactions = BankTransaction.proceeded_between_by_a_user(current_user.id, @start_date, @end_date)
			@paypal_transactions = PaypalTransaction.proceeded_between_by_a_user(current_user.id, @start_date, @end_date)
		end
	end

	# Start of workplace transaction
		def new_workplace_transaction
			@transaction = WpTransaction.new
			@accounts = current_user.account_name_n_id_list
		end

		def register_workplace_transaction
			transaction = WpTransaction.new(params[:transaction])
			if transaction.valid?
				current_user.paypal_transactions << transaction
				transaction.save
				flash[:notice] = 'A transaction registered successfully.'
				redirect_to :action => 'list'
			else
				@transaction = WpTransaction.new
				@accounts = current_user.account_name_n_id_list
				flash[:error] = 'Transaction creation failed.'
				render 'new_workplace_transaction'
			end
		end

		def edit_workplace_transaction
			@transaction = WpTransaction.find_by_id(params[:id])
			@accounts = current_user.account_name_n_id_list
		end

		def update_workplace_transaction
			transaction = WpTransaction.find_by_id(params[:id])
			transaction.update_attributes(params[:transaction])
			if transaction.save
				flash[:notice] = 'A workplace transaction updated successfully.'
				redirect_to :action => 'list'
			else
				@transaction = WpTransaction.find_by_id(params[:id])
				@accounts = current_user.account_name_n_id_list
				flash[:error] = 'A workplace transaction modification was updated successfully.'
				render 'edit_workplace_transaction'
			end
		end

		def delete_workplace_transaction
			@transaction = WpTransaction.find_by_id(params[:id])
		end

		def destroy_workplace_transaction
			transaction = WpTransaction.find_by_id(params[:id])
			if transaction.destroy
				flash[:notice] = 'A workplace transaction deleted successfully.'
				redirect_to :action => 'list'
			else
				@transaction = WpTransaction.find_by_id(params[:id])
				render 'delete_workplace_transaction'
			end
		end
	# end of workplace transaction

	# Start of bank transaction
		def new_bank_transaction
			@transaction = BankTransaction.new
			@banks = Bank.options_for_list
		end

		def register_bank_transaction
			transaction = BankTransaction.new(params[:transaction])
			current_user.bank_transactions << transaction
			if transaction.valid?
				transaction.save
				flash[:notice] = 'A transaction registered successfully.'
				redirect_to :action => 'list'
			else
				@transaction = BankTransaction.new
				@banks = Bank.options_for_list
				flash[:error] = 'Transaction registeration failed.'
				render 'new_workplace_transaction'
			end
		end

		def edit_bank_transaction
			@transaction = BankTransaction.find_by_id(params[:id])
			@banks = Bank.options_for_list
		end

		def update_bank_transaction
			transaction = BankTransaction.find_by_id(params[:id])
			transaction.update_attributes(params[:transaction])
			if transaction.save
				flash[:notice] = 'A transaction updated successfully.'
				redirect_to :action => 'list'
			else
				@transaction = BankTransaction.find_by_id(params[:id])
				@banks = Bank.options_for_list
				flash[:error] = 'Transaction modification was updated successfully.'
				render 'edit_bank_transaction'
			end
		end

		def delete_bank_transaction
			@transaction = BankTransaction.find_by_id(params[:id])
		end

		def destroy_bank_transaction
			transaction = BankTransaction.find_by_id(params[:id])
			if transaction.destroy
				flash[:notice] = 'A workplace transaction deleted successfully.'
				redirect_to :action => 'list'
			else
				@transaction = WpTransaction.find_by_id(params[:id])
				render 'delete_workplace_transaction'
			end
		end
	# end of bank transaction

	# Start of paypal transaction
		def new_paypal_transaction
			@transaction = PaypalTransaction.new
			@paypals = Paypal.options_for_list
		end

		def register_paypal_transaction
			transaction = PaypalTransaction.new(params[:transaction])
			current_user.paypal_transactions << transaction
			if transaction.valid?
				transaction.save
				flash[:notice] = 'A transaction registered successfully.'
				redirect_to :action => 'list'
			else
				@transaction = PaypalTransaction.new
				@paypals = Paypal.options_for_list
				flash[:error] = 'Transaction registeration failed.'
				render 'new_workplace_transaction'
			end
		end

		def edit_paypal_transaction
			@transaction = PaypalTransaction.find_by_id(params[:id])
			@paypals = Paypal.options_for_list
		end

		def update_paypal_transaction
			transaction = PaypalTransaction.find_by_id(params[:id])
			transaction.update_attributes(params[:transaction])
			if transaction.save
				flash[:notice] = 'A transaction updated successfully.'
				redirect_to :action => 'list'
			else
				@transaction = PaypalTransaction.find_by_id(params[:id])
				@paypals = Paypal.options_for_list
				flash[:error] = 'Transaction modification was updated successfully.'
				render 'edit_paypal_transaction'
			end
		end

		def delete_paypal_transaction
			@transaction = PaypalTransaction.find_by_id(params[:id])
		end

		def destroy_paypal_transaction
			transaction = PaypalTransaction.find_by_id(params[:id])
			if transaction.destroy
				flash[:notice] = 'A workplace transaction deleted successfully.'
				redirect_to :action => 'list'
			else
				@transaction = WpTransaction.find_by_id(params[:id])
				render 'delete_workplace_transaction'
			end
		end
	# end of paypal transaction

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
		
		def checkAuthentication
		  if current_user.nil?
		    redirect_to :controller => 'dashboard'
		  end
		end

		def validation
			# When there is no role in database, or the current use has no role yet
			if current_user.role.nil?
				redirect_to :controller => 'dashboard'
			end
		end
end
