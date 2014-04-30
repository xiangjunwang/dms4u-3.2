class Unit < ActiveRecord::Base

	has_many :users
	
	validates :name, :presence => true, :length => {:maximum => 25}, :uniqueness => true

	def self.options_for_list
		Unit.all.map do |unit|
			[ unit.name, unit.id ]
		end
	end
end
