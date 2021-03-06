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

ActiveRecord::Schema.define(version: 20151231193758) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "sponsor_four"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "stack"
    t.string   "website"
    t.string   "logo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "position"
    t.string   "email"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "image"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "employees", ["company_id"], name: "index_employees_on_company_id"

  create_table "interns", force: :cascade do |t|
    t.integer  "cohort"
    t.string   "twitter"
    t.string   "linked_in"
    t.integer  "company_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "image"
    t.string   "bio"
    t.string   "current_company"
    t.boolean  "change",                 default: true
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "remember_token"
    t.string   "name"
  end

  add_index "interns", ["company_id"], name: "index_interns_on_company_id"
  add_index "interns", ["email"], name: "index_interns_on_email", unique: true
  add_index "interns", ["remember_token"], name: "index_interns_on_remember_token"
  add_index "interns", ["reset_password_token"], name: "index_interns_on_reset_password_token", unique: true

end
