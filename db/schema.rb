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

ActiveRecord::Schema.define(version: 20131108061355) do

  create_table "charges", force: true do |t|
    t.string   "rate"
    t.integer  "lot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "charges", ["lot_id"], name: "index_charges_on_lot_id"

  create_table "lots", force: true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "street"
    t.string   "unitnum"
    t.string   "zip"
    t.integer  "maxtime"
    t.integer  "merchant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lots", ["merchant_id"], name: "index_lots_on_merchant_id"

  create_table "merchants", force: true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.string   "birthday"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "street"
    t.string   "unitnum"
    t.string   "zip"
    t.string   "phone"
    t.string   "merchantStatus"
    t.string   "merchantId"
    t.string   "ssn"
    t.string   "taxId"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "account_number"
    t.string   "route_number"
  end

  create_table "parkers", force: true do |t|
    t.string   "plate"
    t.string   "vin"
    t.datetime "start"
    t.float    "amountpaid"
    t.string   "slotid"
    t.string   "paymentinfo"
    t.integer  "lot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parkers", ["lot_id"], name: "index_parkers_on_lot_id"

  create_table "transactions", force: true do |t|
    t.float    "amount"
    t.string   "status"
    t.string   "transactionId"
    t.string   "remarks"
    t.integer  "parker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transactions", ["parker_id"], name: "index_transactions_on_parker_id"

end
