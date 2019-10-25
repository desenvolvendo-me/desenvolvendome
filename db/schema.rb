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

ActiveRecord::Schema.define(version: 2019_10_25_125709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "knowledges", force: :cascade do |t|
    t.float "experience"
    t.bigint "language_id"
    t.bigint "profile_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["language_id"], name: "index_knowledges_on_language_id"
    t.index ["profile_id"], name: "index_knowledges_on_profile_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.float "score"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "repositories", force: :cascade do |t|
    t.integer "github_id"
    t.string "name"
    t.boolean "fork"
    t.integer "size"
    t.integer "forks_count"
    t.integer "stargazers_count"
    t.integer "commits_count"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_repositories_on_user_id"
  end

  create_table "technologies", force: :cascade do |t|
    t.float "exercise"
    t.bigint "language_id"
    t.bigint "repository_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["language_id"], name: "index_technologies_on_language_id"
    t.index ["repository_id"], name: "index_technologies_on_repository_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "github_id"
    t.string "login"
    t.string "bio"
    t.string "name"
    t.string "avatar"
    t.integer "followers"
    t.integer "following"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
  end

end
