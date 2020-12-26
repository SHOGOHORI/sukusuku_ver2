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

ActiveRecord::Schema.define(version: 2020_12_26_042949) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "children", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "child_number"
    t.string "nick_name"
    t.date "birthday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "avatar"
    t.string "comment"
    t.index ["user_id", "created_at"], name: "index_children_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_children_on_user_id"
  end

  create_table "consultation_comment_replies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "content"
    t.json "image"
    t.bigint "user_id", null: false
    t.bigint "consultation_comment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["consultation_comment_id"], name: "index_consultation_comment_replies_on_consultation_comment_id"
    t.index ["user_id"], name: "index_consultation_comment_replies_on_user_id"
  end

  create_table "consultation_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "content"
    t.json "image"
    t.bigint "user_id", null: false
    t.bigint "consultation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["consultation_id"], name: "index_consultation_comments_on_consultation_id"
    t.index ["user_id"], name: "index_consultation_comments_on_user_id"
  end

  create_table "consultations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "image"
    t.integer "category_id"
    t.boolean "pregnant"
    t.boolean "reception_closed"
    t.integer "child_age_moon_age"
    t.index ["user_id", "created_at"], name: "index_consultations_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_consultations_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "introduction"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "vote_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "vote_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "created_at"], name: "index_vote_comments_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_vote_comments_on_user_id"
    t.index ["vote_id", "created_at"], name: "index_vote_comments_on_vote_id_and_created_at"
    t.index ["vote_id"], name: "index_vote_comments_on_vote_id"
  end

  create_table "vote_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "item"
    t.bigint "vote_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "item_number"
    t.index ["vote_id"], name: "index_vote_items_on_vote_id"
  end

  create_table "vote_relationships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "vote_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "vote_item_id"], name: "index_vote_relationships_on_user_id_and_vote_item_id", unique: true
    t.index ["user_id"], name: "index_vote_relationships_on_user_id"
    t.index ["vote_item_id"], name: "index_vote_relationships_on_vote_item_id"
  end

  create_table "votes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.json "image"
    t.integer "child_age"
    t.integer "child_moon_age"
    t.boolean "pregnant"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "category_id"
    t.index ["user_id", "created_at"], name: "index_votes_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "children", "users"
  add_foreign_key "consultation_comment_replies", "consultation_comments"
  add_foreign_key "consultation_comment_replies", "users"
  add_foreign_key "consultation_comments", "consultations"
  add_foreign_key "consultation_comments", "users"
  add_foreign_key "consultations", "users"
  add_foreign_key "vote_comments", "users"
  add_foreign_key "vote_comments", "votes"
  add_foreign_key "vote_items", "votes"
  add_foreign_key "votes", "users"
end
