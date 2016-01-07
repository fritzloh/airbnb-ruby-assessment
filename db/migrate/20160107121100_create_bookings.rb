class CreateBookings < ActiveRecord::Migration
	def change
		create_table :bookings do |t|
		     t.boolean :booking
		     t.string :check_in
		     t.string :check_out
		     t.string :note
		     t.integer :user_id
		     t.integer :property_id
		      
		     t.timestamps null: false

        end
	end
end