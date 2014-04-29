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

ActiveRecord::Schema.define(:version => 20140428182608) do

  create_table "accounts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "workplace_id"
    t.integer  "country_id"
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "email_password"
    t.integer  "status_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "bank_transactions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "bank_id"
    t.float    "amount"
    t.date     "transaction_date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "banks", :force => true do |t|
    t.string   "account_no"
    t.string   "swift_code"
    t.string   "owner_name"
    t.string   "address"
    t.integer  "status_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "logs", :force => true do |t|
    t.integer  "user_id"
    t.string   "ip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "paypal_transactions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "paypal_id"
    t.float    "amount"
    t.date     "transaction_date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "paypals", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.integer  "status_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "plans", :force => true do |t|
    t.float    "standard"
    t.float    "percent"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "positions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "units", :force => true do |t|
    t.string   "name"
    t.string   "leader"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "name"
    t.date     "birthday"
    t.string   "hashed_password"
    t.string   "salt"
    t.integer  "unit_id"
    t.integer  "position_id"
    t.integer  "role_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "password_reset_token"
    t.datetime "password_expires_after"
    t.string   "authentication_token"
  end

  create_table "workplaces", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "wp_transactions", :force => true do |t|
    t.integer  "account_id"
    t.float    "amount"
    t.date     "transaction_date"
    t.date     "expire_date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
