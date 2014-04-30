class Position < ActiveRecord::Base

	has_many :users

	validates :name, :presence => true, :length => {:maximum => 200}, :uniqueness => true

	def self.options_for_list
		Position.all.map do |pos|
			[ pos.name, pos.id ]
		end
	end

end
