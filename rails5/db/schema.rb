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

ActiveRecord::Schema.define(version: 20171112062937) do

  create_table "access_tokens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "token", null: false
    t.string "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "uk_access_tokens_token", unique: true
    t.index ["user_id"], name: "index_access_tokens_user_id"
  end

  create_table "sample_table", primary_key: "sample_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "sample_name", limit: 50, null: false
    t.text "post", null: false
    t.datetime "created", null: false
  end

  create_table "sample_text_table", primary_key: "sample_id", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.text "sample_text", null: false
  end

  create_table "sample_text_table_1", primary_key: "primary_key", id: :bigint, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.text "text_data", null: false
  end

  create_table "sample_text_table_2", primary_key: "primary_key", id: :bigint, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.text "text_data_1", null: false
    t.text "text_data_2", null: false
  end

  create_table "sample_text_table_3", primary_key: "primary_key", id: :bigint, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.text "text_data_1", limit: 4294967295, null: false
  end

  create_table "sample_text_table_4", primary_key: "primary_key", id: :bigint, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.text "text_data_1", limit: 4294967295, null: false
    t.text "text_data_2", limit: 4294967295, null: false
  end

end
