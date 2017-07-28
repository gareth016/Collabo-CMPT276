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

ActiveRecord::Schema.define(version: 20170723000624) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "commenter"
    t.text     "body",       limit: 65535
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "group_name"
    t.string   "leader"
    t.integer  "leader_id"
    t.string   "tags"
    t.integer  "membership"
    t.integer  "member_count",               default: 0, null: false
    t.text     "group_info",   limit: 65535
    t.text     "github_link",  limit: 65535
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["group_name"], name: "index_groups_on_group_name", using: :btree
    t.index ["leader"], name: "index_groups_on_leader", using: :btree
    t.index ["leader_id"], name: "index_groups_on_leader_id", using: :btree
    t.index ["tags"], name: "index_groups_on_tags", using: :btree
  end

  create_table "groups_posts", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "group_id", null: false
    t.integer "post_id",  null: false
    t.index ["group_id", "post_id"], name: "index_groups_posts_on_group_id_and_post_id", using: :btree
    t.index ["post_id", "group_id"], name: "index_groups_posts_on_post_id_and_group_id", using: :btree
  end

  create_table "groups_tags", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "group_id", null: false
    t.integer "tag_id",   null: false
    t.index ["group_id", "tag_id"], name: "index_groups_tags_on_group_id_and_tag_id", using: :btree
    t.index ["tag_id", "group_id"], name: "index_groups_tags_on_tag_id_and_group_id", using: :btree
  end

  create_table "groups_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  create_table "memberships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_memberships_on_group_id", using: :btree
    t.index ["user_id"], name: "index_memberships_on_user_id", using: :btree
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "user"
    t.string   "title"
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
  end

  create_table "posts_tags", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "post_id", null: false
    t.integer "tag_id",  null: false
    t.index ["post_id", "tag_id"], name: "index_posts_tags_on_post_id_and_tag_id", using: :btree
    t.index ["tag_id", "post_id"], name: "index_posts_tags_on_tag_id_and_post_id", using: :btree
  end

  create_table "taggings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "post_id"
    t.integer  "tag_id"
    t.integer  "groups_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["groups_id"], name: "index_taggings_on_groups_id", using: :btree
    t.index ["post_id"], name: "index_taggings_on_post_id", using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["group_id"], name: "index_users_on_group_id", using: :btree
    t.index ["membership_id"], name: "index_users_on_membership_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "memberships", "groups"
  add_foreign_key "memberships", "users"
  add_foreign_key "taggings", "groups", column: "groups_id"
  add_foreign_key "taggings", "posts"
  add_foreign_key "taggings", "tags"
  add_foreign_key "users", "groups"
  add_foreign_key "users", "memberships"
end
