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

ActiveRecord::Schema.define(:version => 20121024143353) do

  create_table "auctions", :force => true do |t|
    t.string   "description"
    t.string   "image"
    t.string   "category"
    t.string   "brand"
    t.string   "size"
    t.string   "color"
    t.string   "condition"
    t.decimal  "buy_now_price"
    t.decimal  "lowest_accepted_price"
    t.integer  "user_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "title"
    t.integer  "quantity"
    t.boolean  "active",                :default => true
    t.integer  "percent_off"
  end

  add_index "auctions", ["user_id"], :name => "index_auctions_on_user_id"

  create_table "bids", :force => true do |t|
    t.decimal  "value"
    t.integer  "auction_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bids", ["auction_id"], :name => "index_bids_on_auction_id"
  add_index "bids", ["user_id"], :name => "index_bids_on_user_id"

  create_table "delayed_buyers", :force => true do |t|
    t.integer  "auction_id"
    t.integer  "user_id"
    t.datetime "unlock_time", :default => '2012-10-23 15:58:54'
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "delayed_buyers", ["auction_id"], :name => "index_delayed_buyers_on_auction_id"
  add_index "delayed_buyers", ["user_id"], :name => "index_delayed_buyers_on_user_id"

  create_table "product_searches", :force => true do |t|
    t.string   "keywords"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transactions", :force => true do |t|
    t.string   "title"
    t.string   "brand"
    t.string   "image"
    t.string   "category"
    t.string   "color"
    t.string   "condition"
    t.decimal  "value"
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "auction_id"
    t.integer  "bid_id"
  end

  add_index "transactions", ["auction_id"], :name => "index_transactions_on_auction_id"
  add_index "transactions", ["bid_id"], :name => "index_transactions_on_bid_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",      :null => false
    t.string   "encrypted_password",     :default => "",      :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "role",                   :default => "buyer"
    t.string   "user_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "category"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
