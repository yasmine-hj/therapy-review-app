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

ActiveRecord::Schema.define(version: 2019_12_02_135810) do

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.string "stars"
    t.string "content"
    t.integer "therapy_group_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["therapy_group_id"], name: "index_reviews_on_therapy_group_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "therapy_groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "location"
    t.string "duration"
    t.integer "therapy_specialty_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["therapy_specialty_id"], name: "index_therapy_groups_on_therapy_specialty_id"
  end

  create_table "therapy_specialties", force: :cascade do |t|
    t.string "name"
    t.string "desciption"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "name"
    t.string "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "reviews", "therapy_groups"
  add_foreign_key "reviews", "users"
  add_foreign_key "therapy_groups", "therapy_specialties"
end
