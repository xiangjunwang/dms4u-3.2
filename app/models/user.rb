class User < ActiveRecord::Base

	attr_accessible :name, :username, :email, :birthday, :password, :password_confirmation, :new_password, :new_password_confirmation, 
					:previous_username, :remember_me
	attr_accessor	:password, :password_confirmation, :new_password, :new_password_confirmation, 
					:previous_username, :remember_me
	before_save		:encrypt_password

	belongs_to :position
	belongs_to :role
	belongs_to :unit

	has_many :logs
	has_many :accounts
	has_many :paypal_transactions
	has_many :bank_transactions

	validates :username,		:presence => true, 
								:length => {:minimum => 8, :maximum => 25}, 
								:uniqueness => true
	validates :name, 			:presence => true
	validates :new_password,	:confirmation => { :if => Proc.new {|user| !user.new_password.nil? && !user.new_password.empty? } }
	validates :username,		:presence => { :if => Proc.new {|user| user.previous_username.nil? || user.username != user.previous_username} }
	validates :username,		:uniqueness => { :if => Proc.new {|user| user.previous_username.nil? || user.username != user.previous_username} }

	# def self.authenticate_by_email(email, password)
	# 	user = find_by_email(email)
	# 	if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
	# 		user
	# 	else
	# 		nil
	# 	end
	# end
	
	
	# Getting list of accounts belong to this user
	def account_id_list
		accounts.map do |account|
			account.id
		end
	end

	def account_name_n_id_list
		accounts.map do |account|
			[account.username, account.id]
		end
	end

  # Innitializer
	def initialize(attributes = {})
		super # must allow the active record to initialize!
		attributes.each do |name, value|
			send("#{name}=", value)
		end
	end

	def self.authenticate_by_username(username, password)
		user = find_by_username(username)
		if user && user.hashed_password == BCrypt::Engine.hash_secret(password, user.salt)
			user
		else
			nil
		end
	end

	def encrypt_password
		if password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.hashed_password = BCrypt::Engine.hash_secret(password, salt)
		end
	end

end
