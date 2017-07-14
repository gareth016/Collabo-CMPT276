class MakeisAdminNotNull < ActiveRecord::Migration[5.0]
  def change
  	change_column_null(:users, :isAdmin, false, false)
  end
end
