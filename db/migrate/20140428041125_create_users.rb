class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :username
			t.string :name
			t.date :birthday
			t.string :hashed_password
			t.string :salt
			t.references :unit
			t.references :position
			t.references :role

			t.timestamps
		end
	end
end
