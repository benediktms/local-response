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


ActiveRecord::Schema.define(version: 2020_09_15_184730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'bookings', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'job_id', null: false
    t.string 'invoice'
    t.datetime 'confirmed_datetime'
    t.boolean 'completed'
    t.boolean 'confirmed'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.boolean 'declined'
    t.index %w[job_id], name: 'index_bookings_on_job_id'
    t.index %w[user_id], name: 'index_bookings_on_user_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.string 'image'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end


  create_table 'jobs', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'category_id', null: false
    t.string 'title'
    t.string 'description'
    t.string 'address'
    t.datetime 'due_date'
    t.integer 'start_time'
    t.integer 'end_time'
    t.float 'longitude'
    t.float 'latitude'
    t.float 'price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[category_id], name: 'index_jobs_on_category_id'
    t.index %w[user_id], name: 'index_jobs_on_user_id'
  end

  create_table 'reviews', force: :cascade do |t|
    t.bigint 'booking_id', null: false
    t.integer 'rating'
    t.string 'title'
    t.string 'description'
    t.boolean 'tasker'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'user_id', null: false
    t.index %w[booking_id], name: 'index_reviews_on_booking_id'
    t.index %w[user_id], name: 'index_reviews_on_user_id'

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "booking_id", null: false
    t.index ["booking_id"], name: "index_chatrooms_on_booking_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table 'user_categories', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'category_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[category_id], name: 'index_user_categories_on_category_id'
    t.index %w[user_id], name: 'index_user_categories_on_user_id'
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "photo"
    t.boolean "admin"
    t.float "longitude"
    t.float "latitude"
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "jobs"
  add_foreign_key "bookings", "users"
  add_foreign_key "chatrooms", "bookings"
  add_foreign_key "jobs", "categories"
  add_foreign_key "jobs", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "reviews", "users"
  add_foreign_key "user_categories", "categories"
  add_foreign_key "user_categories", "users"
end
