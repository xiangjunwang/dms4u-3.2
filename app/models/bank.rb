class Bank < ActiveRecord::Base

	belongs_to :status
	has_many :bank_transactions

	validates :account_no, :presence => true, :length => {:maximum => 200}, :uniqueness => true
	validates :swift_code, :presence => true, :length => {:maximum => 200}
	validates :owner_name, :presence => true, :length => {:maximum => 200}
	validates :address, :presence => true, :length => {:maximum => 200}

	def self.options_for_list
		Bank.all.map do |bank|
			[ bank.account_no, bank.swift_code, bank.owner_name, bank.id ]
		end
	end
	
end
