class TransactionsController < ApplicationController

	layout 'admin'
	before_filter :markMenuItem, :checkAuthentication
	before_filter :checkWritePermision, :only => [:edit, :delete, :new]

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

	def new
	end

	def edit
	end

	def delete
	end

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
		    redirect_to :action => 'dashboard'
		  end
		end
end
