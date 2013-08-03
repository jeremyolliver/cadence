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

ActiveRecord::Schema.define(version: 20130803061832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "organisations", force: true do |t|
    t.string   "name"
    t.string   "key"
    t.string   "api_token"
    t.boolean  "public_by_default", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organisations", ["api_token"], name: "index_organisations_on_api_token", unique: true, using: :btree
  add_index "organisations", ["key"], name: "index_organisations_on_key", unique: true, using: :btree

  create_table "projects", force: true do |t|
    t.integer  "organisation_id"
    t.string   "name"
    t.string   "key"
    t.boolean  "public",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["organisation_id", "key"], name: "index_projects_on_organisation_id_and_key", unique: true, using: :btree

end
