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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130224182212) do

  create_table "exercise_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "exercise_categories", ["name"], :name => "index_exercise_categories_on_name", :unique => true

  create_table "exercises", :force => true do |t|
    t.string   "name"
    t.integer  "exercise_category_id"
    t.string   "movement"
    t.float    "rep_distance"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.float    "dfactor_body_up",                 :default => 0.0
    t.float    "dfactor_body_down",               :default => 0.0
    t.float    "dfactor_body_lat",                :default => 0.0
    t.float    "dfactor_body_static_tension_max", :default => 0.0
    t.float    "dfactor_body_static_tension_min", :default => 0.0
    t.float    "wfactor_body_up",                 :default => 0.0
    t.float    "wfactor_body_down",               :default => 0.0
    t.float    "wfactor_body_lat",                :default => 0.0
    t.float    "wfactor_body_static_tension_max", :default => 0.0
    t.float    "wfactor_body_static_tension_min", :default => 0.0
  end

  add_index "exercises", ["name"], :name => "index_exercises_on_name", :unique => true

  create_table "reps", :force => true do |t|
    t.integer  "workout_id"
    t.integer  "exercise_id"
    t.float    "weight_additional_kg", :default => 0.0
    t.string   "notes"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "exercise_name"
    t.float    "work_joule"
  end

  add_index "reps", ["workout_id", "created_at"], :name => "index_reps_on_workout_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "workouts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "duration"
    t.float    "weigh_in"
    t.string   "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "date"
  end

  add_index "workouts", ["user_id", "created_at"], :name => "index_workouts_on_user_id_and_created_at"

end
