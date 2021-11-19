# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_19_040738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "current_balances", force: :cascade do |t|
    t.decimal "checking1", precision: 10, scale: 2, default: "0.0"
    t.decimal "checking2", precision: 10, scale: 2, default: "0.0"
    t.decimal "savings1", precision: 10, scale: 2, default: "0.0"
    t.decimal "savings2", precision: 10, scale: 2, default: "0.0"
    t.decimal "credit_card1", precision: 10, scale: 2, default: "0.0"
    t.decimal "credit_card2", precision: 10, scale: 2, default: "0.0"
    t.decimal "credit_card3", precision: 10, scale: 2, default: "0.0"
    t.decimal "credit_card4", precision: 10, scale: 2, default: "0.0"
    t.decimal "net_cash", precision: 10, scale: 2
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "expense_groups", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.date "date"
    t.decimal "amount", precision: 10, scale: 2
    t.string "category"
    t.string "description"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "month"
    t.integer "year"
    t.string "date_identifier"
    t.boolean "recurring", default: false
    t.integer "expense_group_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.date "date"
    t.decimal "amount", precision: 10, scale: 2
    t.string "category"
    t.string "description"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "month"
    t.integer "year"
    t.string "date_identifier"
    t.boolean "recurring", default: false
  end

  create_table "monthly_balances", force: :cascade do |t|
    t.integer "month"
    t.decimal "checking1", precision: 10, scale: 2
    t.decimal "checking2", precision: 10, scale: 2
    t.decimal "savings1", precision: 10, scale: 2
    t.decimal "savings2", precision: 10, scale: 2
    t.decimal "credit_card1", precision: 10, scale: 2
    t.decimal "credit_card2", precision: 10, scale: 2
    t.decimal "credit_card3", precision: 10, scale: 2
    t.decimal "credit_card4", precision: 10, scale: 2
    t.decimal "loan1", precision: 10, scale: 2
    t.decimal "loan2", precision: 10, scale: 2
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "personal_IRA", precision: 10, scale: 2
    t.integer "year"
    t.string "date_identifier"
  end

  create_table "recurring_expenses", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.string "description"
    t.decimal "estimate", precision: 10, scale: 2
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recurring_incomes", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.string "description"
    t.decimal "estimate", precision: 10, scale: 2
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
