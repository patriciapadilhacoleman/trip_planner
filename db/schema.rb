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

ActiveRecord::Schema.define(version: 20190315213158) do

  create_table "days", force: :cascade do |t|
    t.string "date"
    t.string "location"
    t.string "activities"
    t.string "transportation"
    t.integer "trip_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "dep_airport"
    t.string "dep_time"
    t.string "arr_airport"
    t.string "arr_time"
    t.string "price"
    t.string "airline"
    t.string "reservation"
    t.integer "trip_id"
  end

  create_table "travelers", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "dob"
    t.string "home_airport"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.string "beg_date"
    t.string "end_date"
    t.string "budget"
    t.integer "traveler_id"
  end

end
