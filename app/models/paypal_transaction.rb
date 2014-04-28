class PaypalTransaction < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :paypal

	validates :amount, :presence => true
	validates :transaction_date, :presence => true
	
end
