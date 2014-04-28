class Workplace < ActiveRecord::Base

	has_many :accounts
	
	validates :name, :presence => true, :length => {:maximum => 50}, :uniqueness => true

end
