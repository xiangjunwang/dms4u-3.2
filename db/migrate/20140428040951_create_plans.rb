class CreatePlans < ActiveRecord::Migration
	def change
		create_table :plans do |t|
			t.float :standard
			t.float :percent

			t.timestamps
		end
	end
end
