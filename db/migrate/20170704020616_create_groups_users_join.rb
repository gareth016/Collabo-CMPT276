class CreateGroupsUsersJoin < ActiveRecord::Migration[5.0]
  def self.up
    create_table :groups_users, :id => false do |t|
    	t.column 'group_id', :integer
    	t.column 'user_id',	 :integer
    end
  end
  def self.down
  	drop_table 'groups_users'
  end
end
