class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.integer :group_id
      t.string  :group_name
      t.integer :member_count, default: 0, null: false
      t.integer :leader_id 
      t.references :membership, foreign_key: true
      t.timestamps
    end
  end
end
