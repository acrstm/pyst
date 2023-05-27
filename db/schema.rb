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

ActiveRecord::Schema[7.0].define(version: 2023_05_27_101250) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bought_items", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "shopping_list_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_bought_items_on_product_id"
    t.index ["shopping_list_id"], name: "index_bought_items_on_shopping_list_id"
    t.index ["user_id"], name: "index_bought_items_on_user_id"
  end

  create_table "fixed_costs", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.text "comments"
    t.index ["group_id"], name: "index_fixed_costs_on_group_id"
    t.index ["user_id"], name: "index_fixed_costs_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "passcode"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_shopping_lists_on_group_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.integer "assigned_to_id"
    t.boolean "done"
    t.boolean "urgent"
    t.text "comments"
    t.date "deadline"
    t.date "recurrence"
    t.boolean "recurring"
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["group_id"], name: "index_tasks_on_group_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin"
    t.string "address"
    t.date "birthday"
    t.bigint "group_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["group_id"], name: "index_users_on_group_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bought_items", "products"
  add_foreign_key "bought_items", "shopping_lists"
  add_foreign_key "bought_items", "users"
  add_foreign_key "fixed_costs", "groups"
  add_foreign_key "fixed_costs", "users"
  add_foreign_key "shopping_lists", "groups"
  add_foreign_key "tasks", "groups"
  add_foreign_key "tasks", "users"
  add_foreign_key "users", "groups"
end
