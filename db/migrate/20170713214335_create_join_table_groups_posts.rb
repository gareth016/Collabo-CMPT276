class CreateJoinTableGroupsPosts < ActiveRecord::Migration[5.0]
  def change
    create_join_table :groups, :posts do |t|
      t.index [:group_id, :post_id]
      t.index [:post_id, :group_id]
    end
  end
end
