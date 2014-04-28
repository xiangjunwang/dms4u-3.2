class BankTransaction < ActiveRecord::Base

	belongs_to :user
	belongs_to :bank

	has_many :bank_transactions

	validates :amount, :presence => true
	validates :transaction_date, :presence => true

end
