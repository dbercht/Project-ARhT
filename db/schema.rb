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

ActiveRecord::Schema.define(:version => 20120220203705) do

  create_table "classifiers", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clinics", :force => true do |t|
    t.integer  "therapist_id"
    t.integer  "client_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "gesture_samples", :force => true do |t|
    t.integer  "mean"
    t.integer  "signal_length"
    t.integer  "rms"
    t.decimal  "vertices",              :precision => 6, :scale => 3
    t.decimal  "baseline_crosses",      :precision => 6, :scale => 3
    t.integer  "fundamental_frequency"
    t.integer  "variance"
    t.integer  "region_length"
    t.integer  "classifier_id"
    t.integer  "gesture_id"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

  create_table "gestures", :force => true do |t|
    t.text     "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.integer  "clinic_id"
    t.decimal  "metric_one",   :precision => 6, :scale => 3
    t.decimal  "metric_two",   :precision => 6, :scale => 3
    t.decimal  "metric_three", :precision => 6, :scale => 3
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "sessions", ["clinic_id"], :name => "index_sessions_on_clinic_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "authentication_token"
    t.string   "role",                   :limit => 24
    t.string   "name"
    t.string   "surname"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
