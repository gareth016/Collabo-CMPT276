class AddisAdminToUsers < ActiveRecord::Migration[5.0]
	def change
  		change_table :users do |t|
  			t.boolean  :is_Admin, default: false, null: false
		end
  	end
end
