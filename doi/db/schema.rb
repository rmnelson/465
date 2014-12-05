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

ActiveRecord::Schema.define(version: 20141021202300) do

  create_table "doi_bases", force: true do |t|
    t.string "doi_path"
  end

  create_table "doi_histories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "url"
    t.datetime "created"
    t.datetime "updated"
    t.integer  "doi_base_id"
  end

  add_index "doi_histories", ["doi_base_id"], name: "index_doi_histories_on_doi_base_id"

end
