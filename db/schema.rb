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

ActiveRecord::Schema.define(version: 20170621044010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "object_states", force: :cascade do |t|
    t.integer  "object_id",                             null: false
    t.string   "object_type",                           null: false
    t.jsonb    "object_changes",           default: {}, null: false
    t.integer  "timestamp",      limit: 8,              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "object_states", ["object_changes"], name: "index_object_states_on_object_changes", using: :gin

end
