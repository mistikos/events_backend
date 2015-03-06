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

ActiveRecord::Schema.define(version: 20150306000222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "fullname",               default: "", null: false
    t.string   "dni",                    default: "", null: false
    t.integer  "company_id",                          null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["company_id"], name: "index_admins_on_company_id", unique: true, using: :btree
  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checklists", force: true do |t|
    t.boolean  "check_in",        default: false, null: false
    t.string   "place_reserved"
    t.integer  "event_id",                        null: false
    t.integer  "client_id",                       null: false
    t.integer  "recepcionist_id"
    t.datetime "check_in_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "checklists", ["client_id"], name: "index_checklists_on_client_id", using: :btree
  add_index "checklists", ["event_id"], name: "index_checklists_on_event_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "fullname"
    t.string   "dni"
    t.string   "email"
    t.integer  "company_id"
    t.string   "gender"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["company_id"], name: "index_clients_on_company_id", using: :btree
  add_index "clients", ["creator_id"], name: "index_clients_on_creator_id", using: :btree

  create_table "companies", force: true do |t|
    t.string   "name",        null: false
    t.string   "email",       null: false
    t.string   "address"
    t.string   "phone"
    t.string   "logo"
    t.integer  "category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.string   "status",      default: "active"
    t.integer  "duration"
    t.string   "place"
    t.string   "address",     default: ""
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.integer  "company_id"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["company_id"], name: "index_events_on_company_id", using: :btree
  add_index "events", ["creator_id"], name: "index_events_on_creator_id", using: :btree

  create_table "participants", force: true do |t|
    t.integer  "event_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participants", ["company_id"], name: "index_participants_on_company_id", using: :btree
  add_index "participants", ["event_id"], name: "index_participants_on_event_id", using: :btree

end
