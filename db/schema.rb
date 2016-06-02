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

ActiveRecord::Schema.define(version: 20160509215758) do

  create_table "applications", primary_key: "application_id", force: :cascade do |t|
    t.string   "user_email", limit: 45
    t.string   "pet_id",     limit: 45
    t.datetime "date"
    t.integer  "status",     limit: 4
  end

  create_table "appointments", primary_key: "appointment_id", force: :cascade do |t|
    t.string   "user_email", limit: 45
    t.string   "pet_id",     limit: 45
    t.datetime "date"
  end

  create_table "breeds", primary_key: "breed_id", force: :cascade do |t|
    t.string "breed_name", limit: 45
  end

  create_table "businesses", primary_key: "business_id", force: :cascade do |t|
    t.string "location", limit: 45
    t.string "phone",    limit: 45
    t.string "name",     limit: 45
  end

  create_table "donations", primary_key: "donation_id", force: :cascade do |t|
    t.float    "amount", limit: 53
    t.datetime "date",              null: false
  end

  create_table "images", primary_key: "pet_id", force: :cascade do |t|
    t.string  "url",                          limit: 45
    t.string  "saved_pets__user_email",       limit: 45, null: false
    t.integer "saved_pets__pet_id",           limit: 4,  null: false
    t.string  "saved_pets__users_user_email", limit: 45, null: false
    t.integer "saved_pets__pets_pet_id",      limit: 4,  null: false
  end

  create_table "pet_breeds", id: false, force: :cascade do |t|
    t.integer "pet_id",                            limit: 4,  null: false
    t.integer "breed_id",                          limit: 4,  null: false
    t.string  "saved_pets_user_email",             limit: 45, null: false
    t.integer "saved_pets_pet_id",                 limit: 4,  null: false
    t.string  "saved_pets_users_user_email",       limit: 45, null: false
    t.integer "saved_pets_pets_pet_id",            limit: 4,  null: false
    t.integer "saved_pets_businesses_business_id", limit: 4,  null: false
    t.integer "BREED_breed_id",                    limit: 4,  null: false
  end

  create_table "pets", primary_key: "pet_id", force: :cascade do |t|
    t.integer "business_id", limit: 4
    t.string  "pet_name",    limit: 45
    t.string  "pet_type",    limit: 45
    t.string  "age",         limit: 8
    t.string  "gender",      limit: 8
  end

  create_table "saved_pets", id: false, force: :cascade do |t|
    t.string  "user_email",                  limit: 45, null: false
    t.integer "pet_id",                      limit: 4,  null: false
    t.string  "users_user_email",            limit: 45, null: false
    t.integer "pets_pet_id",                 limit: 4,  null: false
    t.integer "businesses_business_id",      limit: 4,  null: false
    t.integer "applications_application_id", limit: 4,  null: false
    t.integer "appointments_appointment_id", limit: 4,  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
