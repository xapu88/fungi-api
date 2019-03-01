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

ActiveRecord::Schema.define(version: 2019_03_01_183527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "floral_species", force: :cascade do |t|
    t.string "name"
    t.string "latin_name"
  end

  create_table "floral_species_habitats", id: false, force: :cascade do |t|
    t.bigint "floral_species_id"
    t.bigint "habitat_id"
    t.index ["floral_species_id"], name: "index_floral_species_habitats_on_floral_species_id"
    t.index ["habitat_id"], name: "index_floral_species_habitats_on_habitat_id"
  end

  create_table "floral_species_substrates", id: false, force: :cascade do |t|
    t.bigint "floral_species_id"
    t.bigint "substrate_id"
    t.index ["floral_species_id"], name: "index_floral_species_substrates_on_floral_species_id"
    t.index ["substrate_id"], name: "index_floral_species_substrates_on_substrate_id"
  end

  create_table "habitat_categories", force: :cascade do |t|
    t.string "name"
    t.text "floral_species_ids", default: [], array: true
  end

  create_table "habitats", force: :cascade do |t|
    t.integer "habitat_category_id"
    t.string "note"
  end

