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

ActiveRecord::Schema.define(version: 20180212212155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "add_client_requests", force: :cascade do |t|
    t.integer "trainer_id"
    t.integer "client_id"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "add_trainer_requests", force: :cascade do |t|
    t.integer "client_id"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "current_workout_exercises", force: :cascade do |t|
    t.bigint "current_workout_id"
    t.bigint "exercise_id"
    t.string "measure"
    t.string "name"
    t.integer "sets"
    t.integer "reps", default: [], array: true
    t.integer "measure_input", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["current_workout_id"], name: "index_current_workout_exercises_on_current_workout_id"
    t.index ["exercise_id"], name: "index_current_workout_exercises_on_exercise_id"
  end

  create_table "current_workouts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "routine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["routine_id"], name: "index_current_workouts_on_routine_id"
    t.index ["user_id"], name: "index_current_workouts_on_user_id"
  end

  create_table "exercise_categories", force: :cascade do |t|
    t.string "name"
    t.string "subject_of_measurement"
    t.string "unit"
    t.string "measure_of_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "exercise_category_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_category_id"], name: "index_exercises_on_exercise_category_id"
    t.index ["user_id"], name: "index_exercises_on_user_id"
  end

  create_table "routine_exercises", force: :cascade do |t|
    t.bigint "routine_id"
    t.bigint "exercise_id"
    t.string "name"
    t.string "description"
    t.integer "sets"
    t.integer "reps", default: [], array: true
    t.text "measure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_routine_exercises_on_exercise_id"
    t.index ["routine_id"], name: "index_routine_exercises_on_routine_id"
  end

  create_table "routines", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_routines_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_trainer"
    t.integer "weight"
    t.bigint "trainer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trainer_id"], name: "index_users_on_trainer_id"
  end

  create_table "workout_exercises", force: :cascade do |t|
    t.bigint "workout_id"
    t.bigint "exercise_id"
    t.string "name"
    t.string "measure_input", default: [], array: true
    t.integer "reps", default: [], array: true
    t.integer "sets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_workout_exercises_on_exercise_id"
    t.index ["workout_id"], name: "index_workout_exercises_on_workout_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "title"
    t.string "time_of_workout"
    t.string "duration"
    t.text "exercises", default: [], array: true
    t.bigint "routine_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["routine_id"], name: "index_workouts_on_routine_id"
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "current_workout_exercises", "current_workouts"
  add_foreign_key "current_workout_exercises", "exercises"
  add_foreign_key "current_workouts", "routines"
  add_foreign_key "current_workouts", "users"
  add_foreign_key "exercises", "users"
  add_foreign_key "routine_exercises", "exercises"
  add_foreign_key "routine_exercises", "routines"
  add_foreign_key "routines", "users"
  add_foreign_key "workout_exercises", "exercises"
  add_foreign_key "workout_exercises", "workouts"
  add_foreign_key "workouts", "routines"
  add_foreign_key "workouts", "users"
end
