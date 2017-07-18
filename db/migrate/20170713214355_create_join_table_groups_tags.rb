class CreateJoinTableGroupsTags < ActiveRecord::Migration[5.0]
  def change
    create_join_table :groups, :tags do |t|
      t.index [:group_id, :tag_id]
      t.index [:tag_id, :group_id]
    end
  end
end
