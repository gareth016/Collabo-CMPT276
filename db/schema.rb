# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20170729023659) do
=======
ActiveRecord::Schema.define(version: 20170723000624) do
>>>>>>> 24a8d2b50fcc6c4bec5c7bdae0b67f2e96b6752c

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
<<<<<<< HEAD
  end

  create_table "group_users", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
=======
>>>>>>> 24a8d2b50fcc6c4bec5c7bdae0b67f2e96b6752c
  end

  create_table "groups", force: :cascade do |t|
    t.string   "group_name"
    t.integer  "leader_id"
    t.integer  "member_count", default: 0, null: false
    t.integer  "membership"
<<<<<<< HEAD
=======
<<<<<<< HEAD
    t.integer  "member_count",               default: 0, null: false
    t.text     "group_info",   limit: 65535
    t.text     "github_link",  limit: 65535
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["group_name"], name: "index_groups_on_group_name", using: :btree
    t.index ["leader"], name: "index_groups_on_leader", using: :btree
    t.index ["leader_id"], name: "index_groups_on_leader_id", using: :btree
    t.index ["tags"], name: "index_groups_on_tags", using: :btree
=======
>>>>>>> 24a8d2b50fcc6c4bec5c7bdae0b67f2e96b6752c
    t.text     "group_info"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["group_name"], name: "index_groups_on_group_name"
    t.index ["leader_id"], name: "index_groups_on_leader_id"
<<<<<<< HEAD
=======
>>>>>>> 00e534527c8bf5d45a61ac923b5de5c8685e3d17
>>>>>>> 24a8d2b50fcc6c4bec5c7bdae0b67f2e96b6752c
  end

  create_table "groups_posts", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "post_id",  null: false
  end

  create_table "groups_tags", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "tag_id",   null: false
<<<<<<< HEAD
=======
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_memberships_on_group_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
>>>>>>> 24a8d2b50fcc6c4bec5c7bdae0b67f2e96b6752c
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
<<<<<<< HEAD
    t.text     "post"
    t.string   "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
    t.index ["tags"], name: "index_posts_on_tags"
    t.index ["user_id"], name: "index_posts_on_user_id"
=======
<<<<<<< HEAD
    t.text     "post",       limit: 65535
    t.string   "group"
    t.string   "tags"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["group"], name: "index_posts_on_group", using: :btree
    t.index ["tags"], name: "index_posts_on_tags", using: :btree
    t.index ["title"], name: "index_posts_on_title", using: :btree
    t.index ["user"], name: "index_posts_on_user", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
=======
    t.text     "post"
    t.string   "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tags"], name: "index_posts_on_tags"
    t.index ["user_id"], name: "index_posts_on_user_id"
>>>>>>> 00e534527c8bf5d45a61ac923b5de5c8685e3d17
>>>>>>> 24a8d2b50fcc6c4bec5c7bdae0b67f2e96b6752c
  end

  create_table "posts_tags", id: false, force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "tag_id",  null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "tag_id"
    t.integer  "groups_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["groups_id"], name: "index_taggings_on_groups_id"
    t.index ["post_id"], name: "index_taggings_on_post_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email",                  default: "",    null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "is_Admin",               default: false, null: false
    t.integer  "membership_id"
    t.integer  "group_id"
<<<<<<< HEAD
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
=======
<<<<<<< HEAD
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["group_id"], name: "index_users_on_group_id", using: :btree
    t.index ["membership_id"], name: "index_users_on_membership_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
=======
>>>>>>> 24a8d2b50fcc6c4bec5c7bdae0b67f2e96b6752c
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["group_id"], name: "index_users_on_group_id"
    t.index ["membership_id"], name: "index_users_on_membership_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
<<<<<<< HEAD
=======
>>>>>>> 00e534527c8bf5d45a61ac923b5de5c8685e3d17
>>>>>>> 24a8d2b50fcc6c4bec5c7bdae0b67f2e96b6752c
  end

end
