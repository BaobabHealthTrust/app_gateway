ActiveRecord::Schema.define(version: 1 ) do

  create_table "usages", primary: "usage_id", force: :cascade do |t|
      t.integer "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
  end

  create_table "applications", primary_key: "application_id", force: :cascade do |t|
      t.string "application_name", limit: 50
      t.string "url", limit: 255
      t.string "icon_link", limit: 255
      t.integer "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
  end
  create_table "users" , primary_key: "user_id", force: :cascade do |t|
      t.string "username", limit: 50
      t.string "password", limit: 255
      t.string "salt", limit: 255
      t.string "first_name", limit: 50
      t.string "last_name", limit: 50
      t.datetime "date_created"
      t.string "user_status"
      t.string "role"
  end

  create_table "sessions", primary_key: "id", force: :cascade do |t|
      t.string "session_id", limit: 50
      t.text "data", limit: 255
      t.datetime "created_at"
      t.datetime "updated_at"
  end

  create_table "frequencies" do |t|
      t.integer "application"
      t.string  "client"
      t.datetime "created_at"
      t.datetime "updated_at"
  end
end