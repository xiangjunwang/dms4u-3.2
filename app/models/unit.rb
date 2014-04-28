class Unit < ActiveRecord::Base

	has_many :users
	
	validates :name, :presence => true, :length => {:maximum => 25}, :uniqueness => true
end
