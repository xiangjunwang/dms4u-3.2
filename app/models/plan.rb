class Plan < ActiveRecord::Base
	validates :standard, :presence => true
	validates :percent, :presence => true
end
