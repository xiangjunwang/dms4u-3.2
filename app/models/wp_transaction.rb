class WpTransaction < ActiveRecord::Base

	belongs_to :account

	validates :amount, :presence => true
end
