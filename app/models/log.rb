class Log < ActiveRecord::Base
	
	belongs_to :user

	validates :ip, :presence => true, :length => {:minimum => 7, :maximum => 15}
	
end
