class CreatePaypals < ActiveRecord::Migration
	def change
		create_table :paypals do |t|
			t.string :email
			t.string :name
			t.references :status

			t.timestamps
		end
	end
end
