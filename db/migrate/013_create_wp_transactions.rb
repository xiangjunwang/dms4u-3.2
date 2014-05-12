class CreateWpTransactions < ActiveRecord::Migration
	def change
		create_table :wp_transactions do |t|
			t.references :account
			t.float :amount
			t.date :transaction_date
			t.date :expire_date

			t.timestamps
		end
	end
end
