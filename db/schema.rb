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

ActiveRecord::Schema.define(:version => 20120620215939) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "zone_id"
    t.string   "type"
    t.integer  "restaurant_id"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true
  add_index "admin_users", ["restaurant_id"], :name => "index_admin_users_on_restaurant_id"
  add_index "admin_users", ["zone_id"], :name => "index_admin_users_on_zone_id"

  create_table "assignements", :force => true do |t|
    t.integer  "dish_menu_id"
    t.integer  "dish_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "assignements", ["dish_id"], :name => "index_assignements_on_dish_id"
  add_index "assignements", ["dish_menu_id"], :name => "index_assignements_on_dish_menu_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dish_menus", :force => true do |t|
    t.string   "title"
    t.date     "begin_date"
    t.date     "end_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dish_menus_dishes", :id => false, :force => true do |t|
    t.integer "dish_menu_id"
    t.integer "dish_id"
  end

  create_table "dishes", :force => true do |t|
    t.string   "name"
    t.decimal  "price_ht"
    t.decimal  "tva"
    t.string   "description"
    t.integer  "category_id"
    t.integer  "country_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "dishes", ["category_id"], :name => "index_dishes_on_category_id"
  add_index "dishes", ["country_id"], :name => "index_dishes_on_country_id"

  create_table "order_lines", :force => true do |t|
    t.integer  "quantity",   :default => 1
    t.integer  "dish_id"
    t.integer  "order_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "order_lines", ["dish_id"], :name => "index_order_lines_on_dish_id"

  create_table "orders", :force => true do |t|
    t.datetime "completed_at"
    t.datetime "ready_at"
    t.datetime "provided_at"
    t.datetime "paid_at"
    t.integer  "table_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "status_cd"
  end

  add_index "orders", ["table_id"], :name => "index_orders_on_table_id"

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "zip_code"
    t.string   "city"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tables", :force => true do |t|
    t.integer  "number"
    t.integer  "zone_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tables", ["zone_id"], :name => "index_tables_on_zone_id"

  create_table "tests", :force => true do |t|
    t.string   "test"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "zones", :force => true do |t|
    t.string   "name"
    t.integer  "restaurant_id"
    t.integer  "waiter_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "zones", ["restaurant_id"], :name => "index_zones_on_restaurant_id"
  add_index "zones", ["waiter_id"], :name => "index_zones_on_waiter_id"

end
