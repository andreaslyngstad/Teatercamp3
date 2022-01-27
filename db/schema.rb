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

ActiveRecord::Schema.define(version: 2018_11_11_114926) do

  create_table "camps", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "description", limit: 255
    t.integer "age1"
    t.integer "age2"
    t.datetime "begin"
    t.datetime "end"
    t.integer "participants"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "public"
    t.text "ingress"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "des", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_posts", force: :cascade do |t|
    t.integer "category_id", limit: 11, null: false
    t.integer "post_id", limit: 11
    t.index ["category_id"], name: "index_categories_posts_on_category_id"
    t.index ["post_id"], name: "index_categories_posts_on_post_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "post_id"
    t.string "author", limit: 255
    t.string "author_email", limit: 255
    t.text "content"
    t.string "status", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_notes", force: :cascade do |t|
    t.integer "invoice_id"
    t.float "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_files", force: :cascade do |t|
    t.string "photo_file_name", limit: 255
    t.string "photo_content_type", limit: 255
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean "use"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "registration_id"
    t.integer "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "paid"
    t.boolean "sent"
    t.datetime "made_date"
    t.datetime "pay_by"
    t.datetime "reminder_date"
  end

  create_table "messages", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "email", limit: 255
    t.string "subject", limit: 255
    t.text "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "options", force: :cascade do |t|
    t.string "app_name", limit: 255
    t.string "css", limit: 255
    t.string "owner_name", limit: 255
    t.string "meta_keywords", limit: 255
    t.string "meta_description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "camp_photo_file_name", limit: 255
    t.string "camp_photo_content_type", limit: 255
    t.integer "camp_photo_file_size"
    t.datetime "camp_photo_updated_at"
    t.string "blogg_photo_file_name", limit: 255
    t.string "blogg_photo_content_type", limit: 255
    t.integer "blogg_photo_file_size"
    t.datetime "blogg_photo_updated_at"
    t.string "quote1", limit: 255
    t.string "quote2", limit: 255
    t.string "quote3", limit: 255
    t.string "quote4", limit: 255
    t.string "account", limit: 255
    t.string "vat_number", limit: 255
  end

  create_table "pages", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "title", limit: 255
    t.text "body"
    t.integer "parent_id"
    t.string "navlabel", limit: 255
    t.integer "lft"
    t.integer "rgt"
    t.integer "proposed_parent_id", limit: 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "nav_photo_file_name", limit: 255
    t.string "nav_photo_content_type", limit: 255
    t.integer "nav_photo_file_size"
    t.datetime "nav_photo_updated_at"
    t.string "main_photo_file_name", limit: 255
    t.string "main_photo_content_type", limit: 255
    t.integer "main_photo_file_size"
    t.datetime "main_photo_updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", limit: 255
    t.text "content"
    t.integer "author_id"
    t.string "status", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "comments_count", limit: 4, default: 0, null: false
    t.text "lead"
  end

  create_table "pricings", force: :cascade do |t|
    t.integer "camp_id"
    t.integer "product_id"
  end

  create_table "products", force: :cascade do |t|
    t.float "total_price"
    t.string "description", limit: 255
    t.float "vat"
    t.integer "camp_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "age"
    t.string "parent_one_name", limit: 255
    t.string "parent_two_name", limit: 255
    t.string "parent_one_phone", limit: 255
    t.string "parent_two_phone", limit: 255
    t.string "billing_email", limit: 255
    t.text "tell"
    t.text "medical"
    t.integer "camp_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "paid"
  end

  create_table "simple_captcha_data", force: :cascade do |t|
    t.string "key", limit: 40
    t.string "value", limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.string "taggable_type", limit: 255
    t.datetime "created_at"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type"], name: "index_taggings_on_taggable_id_and_taggable_type"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string "login", limit: 40
    t.string "first_name", limit: 100, default: ""
    t.string "last_name", limit: 100, default: ""
    t.string "email", limit: 100
    t.string "salt", limit: 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "password_hash", limit: 255
    t.string "password_salt", limit: 255
    t.index ["login"], name: "index_users_on_login", unique: true
  end

end
