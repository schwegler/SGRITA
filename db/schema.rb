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

ActiveRecord::Schema.define(:version => 20121015151104) do

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
    t.string   "display_name"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "assets", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "vendor_sku_number"
    t.string   "status"
    t.string   "mac_address"
    t.string   "serial_number"
    t.integer  "quantity_in_stock"
    t.integer  "quantiy_recieved"
    t.integer  "quantity_shipped"
    t.date     "at_location_at"
    t.date     "decomissioned_at"
    t.date     "purchased_at"
    t.string   "intended_site"
    t.decimal  "price"
    t.decimal  "extended_price"
    t.string   "rus_category"
    t.string   "rus_subcategory"
    t.string   "budget_line_item"
    t.string   "contract"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "rus_po_id"
    t.integer  "shipment_id"
    t.integer  "vendor_id"
    t.integer  "product_id"
    t.integer  "auto_id"
    t.integer  "site_id"
    t.string   "attachment"
  end

  create_table "autos", :force => true do |t|
    t.string   "make"
    t.string   "model"
    t.string   "year"
    t.string   "fleet_number"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.string   "work_phone"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "address"
    t.string   "email"
    t.string   "title"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "manufacturer"
    t.string   "sku_number"
    t.string   "mfr_number"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "rus_pos", :force => true do |t|
    t.decimal  "delivery_cost"
    t.decimal  "sales_tax"
    t.decimal  "total_cost"
    t.string   "terms"
    t.text     "ships_to"
    t.string   "RUS_project_number"
    t.string   "title"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "shipments", :force => true do |t|
    t.string   "carrier"
    t.string   "tracking_number"
    t.string   "tracking_url"
    t.string   "shiping_via"
    t.date     "shipping_at"
    t.date     "on_schedule_at"
    t.date     "shipped_at"
    t.date     "delivered_at"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "gps"
    t.string   "kind"
    t.string   "city"
    t.string   "county"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "phone"
    t.string   "website"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
