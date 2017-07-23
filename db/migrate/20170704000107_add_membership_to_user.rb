class AddMembershipToUser < ActiveRecord::Migration[5.0]
  def change
  	change_table :users do |t|
  		t.references :membership, 	foreign_key: true
  		t.references :group,  	 	foreign_key: true   
  	end
  end
end
