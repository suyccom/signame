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

ActiveRecord::Schema.define(:version => 20130409062325) do

  create_table "paginas", :force => true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "video_webm_file_name"
    t.string   "video_webm_content_type"
    t.integer  "video_webm_file_size"
    t.datetime "video_webm_updated_at"
    t.string   "video_mp4_file_name"
    t.string   "video_mp4_content_type"
    t.integer  "video_mp4_file_size"
    t.datetime "video_mp4_updated_at"
  end

  create_table "solicituds", :force => true do |t|
    t.string   "email_solicitante"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pagina_id"
  end

  add_index "solicituds", ["pagina_id"], :name => "index_solicituds_on_pagina_id"

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "active"
    t.datetime "key_timestamp"
  end

  add_index "users", ["state"], :name => "index_users_on_state"

end
