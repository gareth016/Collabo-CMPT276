class CreatePosts < ActiveRecord::Migration[5.0]
	def change
		create_table :posts do |t|
			t.integer 	:user_id,		index: true, unique: true, foreign_key: true
    		t.string	:title
    		t.text 		:post 	
      		t.string	:tags,			index: true, unique: false, foreign_key: true
			t.timestamps
		end
  	end
end
