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

ActiveRecord::Schema.define(version: 20141202060729) do

  create_table "acls", force: true do |t|
    t.integer  "ssid_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "acls", ["ssid_id"], name: "index_acls_on_ssid_id"
  add_index "acls", ["user_id"], name: "index_acls_on_user_id"

  create_table "gpspoints", force: true do |t|
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "num_sats"
    t.float    "hdofp"
    t.float    "altitude"
    t.float    "hofgae"
    t.float    "speed_km"
    t.float    "speed_mph"
    t.float    "angle"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pollpoints", force: true do |t|
    t.integer  "ssid_id"
    t.integer  "gpspoint_id"
    t.integer  "signal"
    t.integer  "rssi"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pollpoints", ["gpspoint_id"], name: "index_pollpoints_on_gpspoint_id"
  add_index "pollpoints", ["ssid_id"], name: "index_pollpoints_on_ssid_id"

  create_table "ssids", force: true do |t|
    t.string   "ssid"
    t.string   "bssid"
    t.string   "manufacture"
    t.string   "auth"
    t.string   "encryption"
    t.integer  "sec_type"
    t.string   "radio_type"
    t.integer  "channel"
    t.string   "transfer_rates"
    t.string   "special_transfer_rates"
    t.integer  "high_signal"
    t.integer  "high_rssi"
    t.string   "net_type"
    t.string   "label"
    t.boolean  "public"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ssids", ["user_id"], name: "index_ssids_on_user_id"

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
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
