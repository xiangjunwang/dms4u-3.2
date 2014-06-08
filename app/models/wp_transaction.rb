class WpTransaction < ActiveRecord::Base

	belongs_to :account

	validates :amount, :presence => true
	
	# attr_accessible :start_date, :end_date
	# attr_accessor :start_date, :end_date
	
	# Getting sorted activeRecords
	# By user
	scope :sorted, order('wp_transactions.account_id ASC')
	# Getting transactions proceeded between start date and end date
	scope :proceeded_between, lambda {|start_date, end_date| where("created_at >= ? AND created_at <= ?", start_date, end_date )}
	# Getting transactions proceeded between start date and end date by a certain account
	scope :proceeded_between_by_an_account, lambda {|account_id, start_date, end_date| where("account_id = ? AND created_at >= ? AND created_at <= ?", account_id, start_date, end_date )}
	# Getting transactions proceeded between start date and end date by a certain account
	scope :proceeded_between_by_a_user, lambda {|user, start_date, end_date| where(:account_id => user.account_id_list, :transaction_date => start_date..end_date )}
end
