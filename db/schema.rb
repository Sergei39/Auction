# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_25_012514) do

  create_table "descriptions", force: :cascade do |t|
    t.text "text"
    t.float "price"
    t.float "raise_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "product"
    t.integer "buyer"
    t.integer "buyer_id"
    t.datetime "time_end"
    t.string "title"
    t.index ["product"], name: "index_descriptions_on_product", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user"
    t.integer "description"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "text"
    t.datetime "start"
    t.integer "user_id"
    t.integer "reviewer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
