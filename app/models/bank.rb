class Bank < ActiveRecord::Base

	belongs_to :status

	validates :account_no, :presence => true, :length => {:maximum => 200}, :uniqueness => true
	validates :swift_code, :presence => true, :length => {:maximum => 200}
	validates :owner_name, :presence => true, :length => {:maximum => 200}
	validates :address, :presence => true, :length => {:maximum => 200}
	
end
