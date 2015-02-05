class CreatePhones < ActiveRecord::Migration
	def change
		create_table :phones do |t|
			t.integer :person_id
			t.string :address

			t.timestamps null: false
		end
	end
end
