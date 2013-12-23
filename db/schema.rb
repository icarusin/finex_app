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

ActiveRecord::Schema.define(:version => 20131222175847) do

  create_table "asks", :force => true do |t|
    t.integer  "stock_id"
    t.decimal  "price"
    t.integer  "quantity"
    t.integer  "status"
    t.integer  "price_unit"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "bids", :force => true do |t|
    t.integer  "stock_id"
    t.decimal  "price"
    t.integer  "quantity"
    t.integer  "status"
    t.integer  "price_unit"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stock_prices", :force => true do |t|
    t.integer  "stock_id"
    t.datetime "transaction_time"
    t.integer  "bid_id"
    t.integer  "ask_id"
    t.decimal  "price"
    t.integer  "quantity"
    t.integer  "price_unit"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "stock_prices", ["stock_id", "transaction_time"], :name => "index_stock_prices_on_stock_id_and_transaction_time"

  create_table "stocks", :force => true do |t|
    t.string   "ticker"
    t.string   "name"
    t.integer  "quantity"
    t.decimal  "price"
    t.integer  "priceUnit"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "stocks", ["ticker"], :name => "index_stocks_on_ticker", :unique => true

end
