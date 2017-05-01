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

ActiveRecord::Schema.define(version: 20170426063008) do

  create_table "accepts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "request_id", limit: 4
    t.integer  "flag",       limit: 4
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "accepts", ["request_id"], name: "fk_rails_a24bc80ba0", using: :btree
  add_index "accepts", ["user_id"], name: "fk_rails_3ff904bb61", using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "user_id_id", limit: 4
    t.string   "state",      limit: 255
    t.string   "address",    limit: 255
    t.integer  "starttime",  limit: 4
    t.integer  "endtime",    limit: 4
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.date     "date"
    t.integer  "role",       limit: 4
    t.integer  "user_id",    limit: 4
  end

  add_index "requests", ["user_id"], name: "index_requests_on_user_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.integer  "user_one_id", limit: 4
    t.integer  "user_two_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "rooms", ["user_one_id"], name: "fk_rails_dd77a41cea", using: :btree
  add_index "rooms", ["user_two_id"], name: "fk_rails_4d126e7bcb", using: :btree

  create_table "talks", force: :cascade do |t|
    t.integer  "send_user_id", limit: 4
    t.integer  "user_id",      limit: 4
    t.text     "message",      limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "talks", ["send_user_id"], name: "fk_rails_5618d5bb90", using: :btree
  add_index "talks", ["user_id"], name: "fk_rails_8f6036676e", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "name",                   limit: 255
    t.string   "gender",                 limit: 255
    t.integer  "age",                    limit: 4
    t.text     "introduction",           limit: 65535
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "image",                  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "accepts", "requests"
  add_foreign_key "accepts", "users"
  add_foreign_key "rooms", "users", column: "user_one_id"
  add_foreign_key "rooms", "users", column: "user_two_id"
  add_foreign_key "talks", "users"
  add_foreign_key "talks", "users", column: "send_user_id"
end
