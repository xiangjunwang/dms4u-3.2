class Status < ActiveRecord::Base

	validates :name, :presence => true, :length => {:maximum => 10}
	
end
