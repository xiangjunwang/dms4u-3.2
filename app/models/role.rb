class Role < ActiveRecord::Base

	has_many :users
	
	validates :name, :presence => true, :length => {:maximum => 25}, :uniqueness => true

	def self.options_for_list
		Role.all.map do |role|
			[ role.name, role.id ]
		end
	end

end
