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

ActiveRecord::Schema.define(version: 20130717021857) do

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "website_url"
    t.string   "icon_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_id"
  end

  add_index "companies", ["job_id"], name: "index_companies_on_job_id"

  create_table "job_actions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_id"
    t.integer  "job_status_id"
    t.date     "date"
  end

  add_index "job_actions", ["job_id"], name: "index_job_actions_on_job_id"
  add_index "job_actions", ["job_status_id"], name: "index_job_actions_on_job_status_id"

  create_table "job_statuses", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "position"
    t.string   "source"
    t.boolean  "remote"
  end

end
