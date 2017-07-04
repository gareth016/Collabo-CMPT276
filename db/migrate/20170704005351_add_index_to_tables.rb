class AddIndexToTables < ActiveRecord::Migration[5.0]
  def change
	# add_index	:users,		  :group_id,		 unique: true 	#doesn't work
	# add_index	:memberships, :membership_id,	 unique: true 	#doesn't work
	# add_index	:memberships, :user_id,			 unique: true	#doesn't work
	# add_index :memberships, :group_id,         unique: true 	#doesn't work
	add_index	:groups,      :group_id,		 unique: true
	add_index	:groups,	  :group_name,		 unique: true
	add_index   :groups, 	  :leader_id,        unique: false
  end
end
