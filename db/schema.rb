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

ActiveRecord::Schema.define(version: 20150120195727) do

  create_table "charges", force: true do |t|
    t.integer  "user_id"
    t.string   "product_name"
    t.integer  "product_total"
    t.integer  "donation_amount"
    t.integer  "total_amount"
    t.string   "shipping_address"
    t.string   "shipping_recipient_last_name"
    t.string   "shipping_recipient_first_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "charges", ["user_id"], name: "index_charges_on_user_id"

  create_table "destinations", force: true do |t|
    t.string   "name"
    t.string   "region"
    t.string   "country"
    t.boolean  "released",            default: false
    t.integer  "individual_price"
    t.integer  "chronological_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.boolean  "primary",                        default: false
    t.string   "start_destination"
    t.integer  "months_subscribed"
    t.integer  "months_received"
    t.integer  "months_remaining"
    t.string   "shipping_address"
    t.string   "shipping_recipient_last_name"
    t.string   "shipping_recipient_first_names"
    t.string   "current_destination"
    t.string   "destination_waiting"
    t.datetime "send_day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id"

  create_table "users", force: true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "screen_name"
    t.string   "shipping_address"
    t.string   "role"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "created_on"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
