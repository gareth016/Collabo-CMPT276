class CreateGroups < ActiveRecord::Migration[5.0]
  def self.up
    create_table :groups do |t|
      t.string      :group_name,	 index: true,		    unique: true
      t.string      :leader,       index: true,       unique: false
      t.integer     :leader_id,		 index: true,		    unique: false
      t.string      :tags,         index: true,       unique: false, foreign_key: true
      t.integer     :membership,   foreign_key: true, unique: false
      t.integer     :member_count, default: 0,        null: false
      t.text        :group_info
      t.text        :github_repo,  unique: false
      # store link like this: @news_article.attach.url
      # stack overflow link:
      # https://stackoverflow.com/questions/18854385/how-to-redirect-to-a-url-stored-in-the-database-rails

      t.timestamps
    end
  # add_index   :groups,    :group_id,        unique: true
  # add_index   :groups,    :group_name,      unique: true

  end

  def self.down
    drop_table 'groups'
  end

end
