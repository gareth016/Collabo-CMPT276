class CreateGroups < ActiveRecord::Migration[5.0]
  def self.up
    create_table :groups do |t|
      t.string      :group_name
      t.integer     :member_count, default: 0, null: false
      t.integer     :leader_id 
      t.references  :membership, foreign_key: true
      t.text        :group_info

      t.timestamps
    end
  end
  def self.down
    drop_table 'groups'
  end
end
