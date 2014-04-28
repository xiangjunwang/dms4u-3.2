class Account < ActiveRecord::Base

	belongs_to :user
	belongs_to :workplace
	belongs_to :country
	belongs_to :status

	has_many :wp_transactions

	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

	validates :username, :presence => true, :length => {:minimum => 8, :maximum => 25}, :uniqueness => true
	validates :password, :presence => true
	validates :email, :presence => true, :length => {:maximum => 200}, :uniqueness => true, :format => EMAIL_REGEX
	validates :email_password, :presence => true
end
