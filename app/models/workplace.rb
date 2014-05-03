class Workplace < ActiveRecord::Base

	has_many :accounts
	
	validates :name, :presence => true, :length => {:maximum => 50}, :uniqueness => true

	def self.options_for_list
		Workplace.all.map do |workplace|
			[ workplace.name, workplace.id ]
		end
	end

end
