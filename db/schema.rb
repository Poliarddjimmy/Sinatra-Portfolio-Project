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

ActiveRecord::Schema.define(version: 20190628180135) do

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.string   "category_icon"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "class_rooms", force: :cascade do |t|
    t.string   "cr_name"
    t.string   "cr_description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "class_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "class_id"
  end

  create_table "course_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "class_room_id"
    t.string   "course_name"
    t.string   "course_description"
    t.string   "photo"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "modul_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "modul_id"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moduls", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "modul_title"
    t.string   "modul_description"
    t.string   "modul_content"
    t.integer  "modul_number"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "resumes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "education_shool"
    t.string   "education_level"
    t.string   "education_option"
    t.string   "education_end_date"
    t.string   "education_start_date"
    t.string   "skills"
    t.string   "languages"
    t.string   "company_experience"
    t.string   "position"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "task"
    t.string   "title"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "pseudo"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "is_a_teacher"
    t.integer  "is_admin"
    t.string   "photo"
    t.string   "about"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
