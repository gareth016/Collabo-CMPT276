class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.integer 	:membership_id
      t.references 	:group, foreign_key: true
      t.references 	:user, foreign_key: true

      t.timestamps
    end
  end
end
