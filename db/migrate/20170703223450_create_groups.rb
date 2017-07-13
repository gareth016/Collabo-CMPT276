class CreateGroups < ActiveRecord::Migration[5.0]
  def self.up
    create_table :groups do |t|
      t.string      :group_name,	index: true,		unique: true
      t.integer     :leader_id,		index: true,		unique: false
      t.integer     :member_count, default: 0, null: false

      t.integer     :membership, foreign_key: true, unique: false
      t.text        :group_info

      t.timestamps
    end
  # add_index   :groups,    :group_id,        unique: true
  # add_index   :groups,    :group_name,      unique: true

  end

  def self.down
    drop_table 'groups'
  end

end
