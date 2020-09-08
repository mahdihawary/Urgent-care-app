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

ActiveRecord::Schema.define(version: 2020_09_08_154309) do

  create_table "covid_tests", force: :cascade do |t|
    t.string "test_location"
    t.string "test_appointment"
    t.string "result"
    t.integer "patient_id"
    t.string "test_type"
  end

  create_table "diagnoses", force: :cascade do |t|
    t.string "diagnosis"
    t.integer "user_id"
    t.integer "specialist_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "password"
  end

  create_table "patients_symptoms", force: :cascade do |t|
    t.string "symptom"
    t.integer "patient_id"
    t.integer "symptom_id"
  end

  create_table "specialists", force: :cascade do |t|
    t.string "specialist"
  end

  create_table "symptoms", force: :cascade do |t|
    t.string "symptom"
    t.string "name"
    t.string "date"
  end

end
