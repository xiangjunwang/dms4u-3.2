class Status < ActiveRecord::Base

	validates :name, :presence => true, :length => {:maximum => 50}

	has_many :accounts

	def self.options_for_list
		Status.all.map do |status|
			[ status.name, status.id ]
		end
	end
	
end
