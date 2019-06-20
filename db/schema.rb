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

ActiveRecord::Schema.define(version: 20190620010253) do

  create_table "course_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.integer "user_id"
    t.string  "course_name"
    t.string  "course_description"
  end

  create_table "modul_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "modul_id"
  end

  create_table "moduls", force: :cascade do |t|
    t.integer "course_id"
    t.string  "modul_title"
    t.string  "modul_description"
    t.string  "modul_content"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "pseudo"
    t.string "email"
    t.string "password_digest"
  end

end
