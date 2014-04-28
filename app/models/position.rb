class Position < ActiveRecord::Base

	has_many :users

	validates :name, :presence => true, :length => {:maximum => 200}, :uniqueness => true

end
