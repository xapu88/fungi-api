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

ActiveRecord::Schema.define(version: 2019_01_24_005330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "observations", force: :cascade do |t|
    t.string "number"
    t.integer "species_id"
    t.integer "legator_id"
    t.integer "determinator_id"
    t.integer "habitat_id"
    t.integer "substrate_id"
    t.datetime "observed_at"
    t.string "area"
    t.string "location"
    t.decimal "longitude"
    t.decimal "latitude"
    t.decimal "altitude"
    t.text "description"
    t.string "quantity"
    t.string "explored_surface"
    t.boolean "sample"
    t.string "external_url"
    t.boolean "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "full_name"
    t.string "description"
    t.integer "role_id"
  end

end
