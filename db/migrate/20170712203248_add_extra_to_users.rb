class AddExtraToUsers < ActiveRecord::Migration[5.0]
  def change
	add_index :users, :username,		unique: true
	change_table :users do |t|
		t.text 	  :skills
    	t.text	  :about_info
    	t.text	  :location
    	t.text	  :github
	end
  end
end
