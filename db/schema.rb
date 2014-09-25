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

ActiveRecord::Schema.define(:version => 20130419211938) do

  create_table "affected_browsers_data", :force => true do |t|
    t.string  "browser",  :limit => 250, :default => "",   :null => false
    t.string  "label",    :limit => 250, :default => "",   :null => false
    t.integer "priority",                :default => 0,    :null => false
    t.boolean "active",                  :default => true
  end

  create_table "affected_designs_data", :force => true do |t|
    t.string  "category", :limit => 250, :default => "",   :null => false
    t.string  "design",   :limit => 250, :default => "",   :null => false
    t.string  "label",    :limit => 250, :default => "",   :null => false
    t.boolean "active",                  :default => true
  end

  create_table "checklist_items", :force => true do |t|
    t.integer  "release_id",                     :default => 0,     :null => false
    t.integer  "release_data_id",                :default => 0,     :null => false
    t.string   "environment",     :limit => 50,  :default => "",    :null => false
    t.boolean  "value",                          :default => false, :null => false
    t.boolean  "applicable",                     :default => true,  :null => false
    t.string   "modified_by",     :limit => 250, :default => "",    :null => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  create_table "checklist_tools", :force => true do |t|
    t.integer  "release_id",                     :default => 0,     :null => false
    t.integer  "release_data_id",                :default => 0,     :null => false
    t.boolean  "value",                          :default => false, :null => false
    t.string   "modified_by",     :limit => 250, :default => "",    :null => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "release_id",                           :default => 0,  :null => false
    t.integer  "checklist_item_id",                    :default => 0,  :null => false
    t.string   "checklist_item_type", :limit => 250,   :default => "", :null => false
    t.string   "comment",             :limit => 20000, :default => "", :null => false
    t.string   "author",              :limit => 500,   :default => "", :null => false
    t.string   "modified_by",         :limit => 250,   :default => "", :null => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  create_table "release_data", :force => true do |t|
    t.string  "section",  :limit => 50,   :default => "", :null => false
    t.string  "label",    :limit => 1000, :default => "", :null => false
    t.integer "priority",                 :default => 1,  :null => false
  end

  create_table "release_items", :force => true do |t|
    t.integer  "release_id",                        :default => 0,     :null => false
    t.string   "type",              :limit => 250,  :default => "",    :null => false
    t.string   "source",            :limit => 250,  :default => "",    :null => false
    t.string   "source_reference",  :limit => 250,  :default => "",    :null => false
    t.string   "title",             :limit => 500,  :default => "",    :null => false
    t.boolean  "is_config_change",                  :default => false
    t.boolean  "is_data_change",                    :default => false
    t.string   "affected_browsers", :limit => 9000, :default => "",    :null => false
    t.string   "affected_designs",  :limit => 9000, :default => "",    :null => false
    t.string   "affected_product",  :limit => 250,  :default => "",    :null => false
    t.integer  "level_of_comfort",                  :default => 0,     :null => false
    t.integer  "level_of_risk",                     :default => 0,     :null => false
    t.string   "comments",          :limit => 1000, :default => "",    :null => false
    t.string   "modified_by",       :limit => 250,  :default => "",    :null => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  create_table "releases", :force => true do |t|
    t.string   "title",            :limit => 60,  :default => "",    :null => false
    t.string   "contact",          :limit => 250, :default => "",    :null => false
    t.string   "backup_contact",   :limit => 250, :default => "",    :null => false
    t.date     "release_date"
    t.date     "code_cutoff_date"
    t.string   "modified_by",      :limit => 250, :default => "",    :null => false
    t.boolean  "archive",                         :default => false
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
  end

  add_index "releases", ["title"], :name => "index_releases_on_title"

  create_table "users", :force => true do |t|
    t.string   "name",                   :limit => 250, :default => "",    :null => false
    t.string   "email",                                 :default => "",    :null => false
    t.boolean  "admin",                                 :default => false
    t.string   "encrypted_password",                    :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.boolean  "show_timestamps",                       :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
