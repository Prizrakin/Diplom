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

ActiveRecord::Schema[7.0].define(version: 2022_05_19_102911) do
  create_table "chats", force: :cascade do |t|
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_chats_on_product_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_games_on_name", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.string "text"
    t.integer "chat_id", null: false
    t.integer "writer"
    t.integer "recipient"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "service_id", null: false
    t.integer "price"
    t.string "long_description"
    t.string "short_description"
    t.boolean "active"
    t.integer "salesman"
    t.integer "buyer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_products_on_service_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "salesman"
    t.integer "buyer"
    t.string "text"
    t.integer "grade"
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
  end

  create_table "rights", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.integer "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_services_on_game_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "card"
    t.string "cvv"
    t.string "date"
    t.string "owner"
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_transactions_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name"
    t.string "password_digest"
    t.integer "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "chats", "products"
  add_foreign_key "messages", "chats"
  add_foreign_key "products", "services"
  add_foreign_key "reviews", "products"
  add_foreign_key "services", "games"
  add_foreign_key "transactions", "products"
end
