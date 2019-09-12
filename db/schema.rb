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

ActiveRecord::Schema.define(version: 2019_09_11_010636) do

  create_table "booking_processes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "lessor_id"
    t.bigint "space_id"
    t.bigint "document_id"
    t.integer "step"
    t.timestamp "start_date"
    t.timestamp "end_date"
    t.decimal "monthly_fee", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_booking_processes_on_document_id"
    t.index ["lessor_id"], name: "index_booking_processes_on_lessor_id"
    t.index ["space_id"], name: "index_booking_processes_on_space_id"
  end

  create_table "devices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "device_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "document_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "document_type_id"
    t.text "url_document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_type_id"], name: "index_documents_on_document_type_id"
  end

  create_table "jwt_blacklists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "jti"
    t.datetime "exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_blacklists_on_jti"
  end

  create_table "lessees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ruc"
    t.string "commercial_name"
    t.string "first_name"
    t.string "last_name"
    t.integer "doc_type"
    t.string "doc_number"
    t.string "phone"
    t.text "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "doc_type"
    t.string "doc_number"
    t.string "phone"
    t.text "email"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "space_id"
    t.string "address"
    t.decimal "latitude", precision: 10
    t.decimal "longitude", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_locations_on_space_id"
  end

  create_table "photos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "space_id"
    t.text "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_photos_on_space_id"
  end

  create_table "services", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "space_service_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "space_id"
    t.bigint "service_id"
    t.integer "status"
    t.timestamp "start_date"
    t.timestamp "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "service_price", precision: 10
    t.index ["service_id"], name: "index_space_service_details_on_service_id"
    t.index ["space_id"], name: "index_space_service_details_on_space_id"
  end

  create_table "spaces", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "lessee_id"
    t.integer "status"
    t.decimal "width", precision: 10
    t.decimal "height", precision: 10
    t.decimal "area", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "rent_price", precision: 10
    t.index ["lessee_id"], name: "index_spaces_on_lessee_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "booking_processes", "documents"
  add_foreign_key "booking_processes", "lessors"
  add_foreign_key "booking_processes", "spaces"
  add_foreign_key "documents", "document_types"
  add_foreign_key "locations", "spaces"
  add_foreign_key "photos", "spaces"
  add_foreign_key "space_service_details", "services"
  add_foreign_key "space_service_details", "spaces"
  add_foreign_key "spaces", "lessees"
end
