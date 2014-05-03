class Country < ActiveRecord::Base

	has_many :accounts

	validates :name, :presence => true, :length => {:maximum => 50}, :uniqueness => true

	def self.options_for_list
		Country.all.map do |country|
			[ country.name, country.id ]
		end
	end
	
end
