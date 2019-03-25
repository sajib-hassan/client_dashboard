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

ActiveRecord::Schema.define(version: 2019_03_25_195955) do

  create_table "clients", force: :cascade do |t|
    t.string "ctoken"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "identity"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consultants", force: :cascade do |t|
    t.integer "client_id"
    t.integer "contractor_id"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_consultants_on_client_id"
    t.index ["contractor_id"], name: "index_consultants_on_contractor_id"
    t.index ["employee_id"], name: "index_consultants_on_employee_id"
  end

  create_table "contractors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "partner_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_company_id"], name: "index_contractors_on_partner_company_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "identifier"
    t.string "first_name"
    t.string "last_name"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_employees_on_company_id"
  end

  create_table "partner_companies", force: :cascade do |t|
    t.string "identity"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
