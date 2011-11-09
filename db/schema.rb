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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111109194004) do

  create_table "commits", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "repository_id"
  end

  create_table "repositories", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "shortcode"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "repositories", ["name", "user_id"], :name => "index_repositories_on_name_and_user_id", :unique => true
  add_index "repositories", ["shortcode"], :name => "index_repositories_on_shortcode", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "confirmation_token", :limit => 128
    t.string   "remember_token",     :limit => 128
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "time_zone"
    t.string   "api_key"
  end

  add_index "users", ["api_key"], :name => "index_users_on_api_key", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
