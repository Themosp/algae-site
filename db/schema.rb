# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140330123737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "image_attachments", force: true do |t|
    t.integer "image_id"
    t.string  "style"
    t.binary  "file_contents"
  end

  add_index "image_attachments", ["image_id"], name: "index_image_attachments_on_image_id", using: :btree

  create_table "image_translations", force: true do |t|
    t.integer  "image_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "image_translations", ["image_id"], name: "index_image_translations_on_image_id", using: :btree
  add_index "image_translations", ["locale"], name: "index_image_translations_on_locale", using: :btree

  create_table "images", force: true do |t|
    t.string   "title"
    t.integer  "position_for_small"
    t.integer  "position_for_very_small"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_attachment_file_name"
    t.string   "image_attachment_content_type"
    t.integer  "image_attachment_file_size"
    t.datetime "image_attachment_updated_at"
  end

  create_table "linkables_menus", force: true do |t|
    t.integer  "order"
    t.integer  "depth"
    t.integer  "linkable_id"
    t.string   "linkable_type"
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_group_translations", force: true do |t|
    t.integer  "page_group_id", null: false
    t.string   "locale",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "page_group_translations", ["locale"], name: "index_page_group_translations_on_locale", using: :btree
  add_index "page_group_translations", ["page_group_id"], name: "index_page_group_translations_on_page_group_id", using: :btree

  create_table "page_groups", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_groups_pages", force: true do |t|
    t.integer "order"
    t.integer "page_group_id"
    t.integer "page_id"
  end

  add_index "page_groups_pages", ["page_group_id", "page_id"], name: "index_page_groups_pages_on_page_group_id_and_page_id", using: :btree
  add_index "page_groups_pages", ["page_id"], name: "index_page_groups_pages_on_page_id", using: :btree

  create_table "page_translations", force: true do |t|
    t.integer  "page_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "body"
  end

  add_index "page_translations", ["locale"], name: "index_page_translations_on_locale", using: :btree
  add_index "page_translations", ["page_id"], name: "index_page_translations_on_page_id", using: :btree

  create_table "pages", force: true do |t|
    t.string   "title"
    t.string   "title_link"
    t.text     "body"
    t.boolean  "big_image"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "image_id"
    t.integer  "back_link_id"
    t.string   "back_link_type"
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", unique: true, using: :btree

  create_table "static_translations", force: true do |t|
    t.integer  "static_id",  null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "static_translations", ["locale"], name: "index_static_translations_on_locale", using: :btree
  add_index "static_translations", ["static_id"], name: "index_static_translations_on_static_id", using: :btree

  create_table "statics", force: true do |t|
    t.string   "title"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
