class AddSenderInfoToBankTransactions < ActiveRecord::Migration
	def change
		add_column :bank_transactions, :sender_account_no, :string
    	add_column :bank_transactions, :sender_swift_code, :string
    	add_column :bank_transactions, :sender_name, :string
    	add_column :bank_transactions, :sender_address, :string
	end
end
