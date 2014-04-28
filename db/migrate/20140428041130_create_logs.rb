class CreateLogs < ActiveRecord::Migration
	def change
		create_table :logs do |t|
			t.references :user
			t.string :ip

			t.timestamps
		end
	end
end
