class AddGroupIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :group_id, :integer
  end
end
