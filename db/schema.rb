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

ActiveRecord::Schema.define(version: 2019_04_08_175457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

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

  create_table "roles", force: :cascade do |t|
    t.string "name"
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "genus"
    t.string "familia"
    t.string "ordo"
    t.string "subclassis"
    t.string "classis"
    t.string "subphylum"
    t.string "phylum"
    t.boolean "edible"
    t.boolean "cultivated"
    t.boolean "poisonous"
    t.boolean "medicinal"
  end

  create_table "substrate_categories", force: :cascade do |t|
    t.string "name"
    t.text "floral_species_ids", default: [], array: true
  end

  create_table "substrates", force: :cascade do |t|
    t.integer "substrate_category_id"
    t.string "note"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "full_name"
    t.string "description"
    t.integer "role_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
