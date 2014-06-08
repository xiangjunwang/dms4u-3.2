class Paypal < ActiveRecord::Base

	belongs_to :status
	has_many :paypal_transactions

	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

	validates :email, :presence => true, :length => {:maximum => 200}, :uniqueness => true, :format => EMAIL_REGEX
	validates :name, :presence => true, :length => {:maximum => 200}

	def self.options_for_list
		Paypal.all.map do |paypal|
			[ paypal.email, paypal.id ]
		end
	end

end
