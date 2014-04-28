class CreateBankTransactions < ActiveRecord::Migration
	def change
		create_table :bank_transactions do |t|
			t.references :user
			t.references :bank
			t.float :amount
			t.date :transaction_date

			t.timestamps
		end
	end
end
