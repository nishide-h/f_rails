# frozen_string_literal: true

ActiveRecord::Schema.define(version: 20_180_305_021_657) do
  create_table "tweets", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "location"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
