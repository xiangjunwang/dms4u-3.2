class BankTransaction < ActiveRecord::Base

	belongs_to :user
	belongs_to :bank

	has_many :bank_transactions

	validates :amount, :presence => true
	validates :transaction_date, :presence => true
	
	# Getting sorted Bank Transactions
	scope :sorted, order('bank_transactions.user_id ASC')
	# Getting transactions proceeded between start date and end date
  scope :proceeded_between, lambda {|start_date, end_date| where("transaction_date >= ? AND transaction_date <= ?", start_date, end_date )}
  # Getting transactions proceeded between start date and end date by a certain account
  scope :proceeded_between_by_a_user, lambda {|user_id, start_date, end_date| where(:user_id => user_id, :transaction_date => start_date..end_date )}

end
