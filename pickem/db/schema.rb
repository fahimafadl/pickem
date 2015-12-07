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

ActiveRecord::Schema.define(version: 20151207014713) do

  create_table "divisions", force: :cascade do |t|
    t.string   "name"
    t.string   "data_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "ht_id"
    t.integer  "hscore"
    t.string   "at_id"
    t.integer  "ascore"
    t.integer  "week"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "picks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "pick"
    t.integer  "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "team_id"
    t.string   "name"
    t.string   "logo_url"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "played"
    t.float    "off_pass_ypg"
    t.float    "off_rush_ypg"
    t.float    "off_tot_ypg"
    t.float    "def_pass_ypg"
    t.float    "def_rush_ypg"
    t.float    "def_tot_ypg"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "division"
  end

  create_table "user_records", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "total"
    t.float    "ratio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_hash"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
