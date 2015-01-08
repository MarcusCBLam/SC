# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150108201011) do

  create_table "_cms_users", primary_key: "uid", force: true do |t|
    t.integer "live",              limit: 1
    t.string  "username",          limit: 50
    t.string  "firstname",         limit: 50
    t.string  "lastname",          limit: 50
    t.string  "company",           limit: 50
    t.string  "email",             limit: 100
    t.string  "password",          limit: 50
    t.text    "comments"
    t.integer "soundcraft",        limit: 1
    t.integer "studer",            limit: 1
    t.integer "usa_soundcraft",    limit: 1
    t.integer "usa_studer",        limit: 1
    t.integer "gigrac",            limit: 1
    t.integer "soundcraftdigital", limit: 1
    t.integer "urei",              limit: 1
    t.integer "main",              limit: 1
    t.integer "products",          limit: 1
    t.integer "news",              limit: 1
    t.integer "support",           limit: 1
    t.integer "downloads",         limit: 1
    t.integer "contacts",          limit: 1
    t.integer "distributor_area",  limit: 1
    t.integer "mailing",           limit: 1
    t.integer "admin",             limit: 1
  end

  add_index "_cms_users", ["gigrac"], name: "idx_gigrac", using: :btree
  add_index "_cms_users", ["soundcraft"], name: "idx_soundcraft", using: :btree
  add_index "_cms_users", ["soundcraftdigital"], name: "idx_sd", using: :btree
  add_index "_cms_users", ["studer"], name: "idx_studer", using: :btree
  add_index "_cms_users", ["urei"], name: "idx_urei", using: :btree
  add_index "_cms_users", ["username", "password"], name: "idx_login", using: :btree

  create_table "_cms_users_types", primary_key: "tid", force: true do |t|
    t.string "description"
  end

  create_table "_downloads_WIP", force: true do |t|
    t.integer  "download_category_id"
    t.integer  "download_sub_category_id"
    t.integer  "live"
    t.string   "title"
    t.string   "keywords"
    t.string   "slug"
    t.string   "download_file_name"
    t.string   "download_content_type"
    t.integer  "download_file_size"
    t.datetime "download_updated_at"
    t.string   "author",                   limit: 100
    t.integer  "position"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at"
  end

  add_index "_downloads_wip", ["id"], name: "product_attachment_id", unique: true, using: :btree

  create_table "_dt_distributors", primary_key: "d_id", force: true do |t|
    t.integer "c_id",         limit: 2
    t.integer "primary_flag", limit: 1
    t.string  "contact",      limit: 100
    t.string  "company",      limit: 100
    t.string  "address_1",    limit: 50
    t.string  "address_2",    limit: 50
    t.string  "address_3",    limit: 50
    t.string  "address_4",    limit: 50
    t.string  "address_5",    limit: 50
    t.string  "address_6",    limit: 50
    t.string  "phone",        limit: 50
    t.string  "fax",          limit: 50
    t.string  "email_1",      limit: 100
    t.string  "email_2",      limit: 100
    t.string  "website",      limit: 100
    t.string  "user_name",    limit: 50
    t.string  "password",     limit: 50
    t.integer "live",         limit: 1,   default: 1
  end

  add_index "_dt_distributors", ["d_id"], name: "distributor_id", unique: true, using: :btree

  create_table "_dt_distributors_downloads", id: false, force: true do |t|
    t.integer   "product_attachment_id",   limit: 2, default: 0, null: false
    t.integer   "product_id",              limit: 2
    t.string    "product_attachment_desc"
    t.text      "product_attachment_file"
    t.integer   "product_attachment_type", limit: 2
    t.date      "posted_date"
    t.timestamp "timestamp",                                     null: false
    t.integer   "display_order",           limit: 2
  end

  add_index "_dt_distributors_downloads", ["product_attachment_id"], name: "product_attachment_id", unique: true, using: :btree

  create_table "_dt_distributors_users", primary_key: "user_id", force: true do |t|
    t.string "user_name", limit: 25,  default: ""
    t.string "surname",   limit: 100, default: ""
    t.string "password",  limit: 100, default: ""
    t.string "email",     limit: 100
  end

  create_table "_dt_download_old", primary_key: "d_id", force: true do |t|
    t.integer   "live",      limit: 1
    t.integer   "p_id",      limit: 2
    t.integer   "cat_id",    limit: 2
    t.integer   "subcat_id", limit: 2
    t.string    "title",     limit: 200
    t.string    "filename"
    t.string    "filetype",  limit: 100
    t.integer   "filesize",  limit: 8
    t.string    "thumbnail", limit: 100
    t.integer   "sortorder", limit: 2
    t.string    "author",    limit: 100
    t.timestamp "timestamp",             null: false
  end

  add_index "_dt_download_old", ["d_id"], name: "product_attachment_id", unique: true, using: :btree

  create_table "_dt_downloads", primary_key: "d_id", force: true do |t|
    t.integer   "live",      limit: 1
    t.integer   "p_id",      limit: 2
    t.integer   "cat_id",    limit: 2
    t.integer   "subcat_id", limit: 2
    t.string    "title",     limit: 200
    t.string    "filename"
    t.string    "filetype",  limit: 100
    t.integer   "filesize",  limit: 8
    t.string    "thumbnail", limit: 100
    t.integer   "sortorder", limit: 2
    t.string    "author",    limit: 100
    t.timestamp "timestamp",             null: false
  end

  add_index "_dt_downloads", ["d_id"], name: "product_attachment_id", unique: true, using: :btree

  create_table "_dt_downloads_technical_bulletins", id: false, force: true do |t|
    t.integer   "product_attachment_id",   limit: 2, default: 0, null: false
    t.integer   "product_id",              limit: 2
    t.string    "product_attachment_desc"
    t.text      "product_attachment_file"
    t.integer   "product_attachment_type", limit: 2
    t.date      "posted_date"
    t.timestamp "timestamp",                                     null: false
    t.integer   "display_order",           limit: 2
  end

  add_index "_dt_downloads_technical_bulletins", ["product_attachment_id"], name: "product_attachment_id", unique: true, using: :btree

  create_table "_dt_knowledgebase", primary_key: "kbid", force: true do |t|
    t.integer "tid"
    t.integer "pid"
    t.integer "cid"
    t.string  "title"
    t.text    "body"
    t.string  "author", limit: 100
    t.integer "live"
    t.integer "secure"
    t.date    "datim"
  end

  create_table "_dt_news", primary_key: "n_id", force: true do |t|
    t.text      "news_title"
    t.text      "news_body"
    t.string    "news_image",    limit: 200
    t.string    "news_image_tn", limit: 200
    t.datetime  "news_date"
    t.integer   "news_type"
    t.integer   "country_id"
    t.integer   "featured",                  default: 0
    t.integer   "live",                      default: 0
    t.timestamp "timestamp",                             null: false
    t.string    "ip_address"
  end

  add_index "_dt_news", ["n_id"], name: "news_id", unique: true, using: :btree

  create_table "_dt_product_dimms", primary_key: "tid", force: true do |t|
    t.integer   "pid"
    t.text      "htmlcodes"
    t.integer   "live"
    t.timestamp "timestamp"
  end

  create_table "_dt_product_extra", primary_key: "eid", force: true do |t|
    t.integer "pid"
    t.string  "title",     limit: 100
    t.text    "content"
    t.integer "sortorder"
    t.integer "live",                  default: 1
    t.string  "custom",    limit: 100
  end

  create_table "_dt_product_matrix", primary_key: "m_id", force: true do |t|
    t.integer "p_id"
    t.string  "product_name",    limit: 100
    t.string  "image",           limit: 100
    t.string  "Price_band",      limit: 10
    t.string  "audio",           limit: 10
    t.string  "stereo_channels", limit: 10
    t.integer "digital_io"
    t.integer "fx_processors"
    t.integer "groups"
    t.integer "eq_bands"
    t.integer "aux_sends"
    t.integer "returns"
    t.integer "direct_outputs"
    t.integer "matrix_outputs"
    t.string  "main_bus_out",    limit: 5
    t.integer "live"
  end

  add_index "_dt_product_matrix", ["m_id"], name: "idx_mid", using: :btree
  add_index "_dt_product_matrix", ["p_id"], name: "idx_pid", using: :btree

  create_table "_dt_product_matrix_applications", id: false, force: true do |t|
    t.integer "m_id",  null: false
    t.integer "a_id"
    t.integer "value"
  end

  add_index "_dt_product_matrix_applications", ["m_id"], name: "idx_mid", using: :btree

  create_table "_dt_user_brochure_requests", primary_key: "br_id", force: true do |t|
    t.integer   "u_id",            limit: 8
    t.integer   "a_id"
    t.string    "product_request", limit: 100
    t.string    "comments"
    t.string    "ip_address",      limit: 20
    t.timestamp "datim"
  end

  create_table "_dt_user_contact_form", primary_key: "br_id", force: true do |t|
    t.integer   "u_id",       limit: 8
    t.integer   "q_id"
    t.text      "message"
    t.string    "ip_address", limit: 20
    t.timestamp "datim"
  end

  create_table "_dt_user_interests", primary_key: "u_id", force: true do |t|
    t.integer  "a_id"
    t.string   "influence", limit: 100
    t.string   "hear",      limit: 100
    t.string   "magazines"
    t.datetime "datim"
  end

  create_table "_dt_user_mailing_database", primary_key: "br_id", force: true do |t|
    t.integer   "u_id",             limit: 8
    t.integer   "a_id"
    t.integer   "training_courses", limit: 1,  default: 0
    t.integer   "mwp",              limit: 1
    t.integer   "broadcast",        limit: 1,  default: 0
    t.integer   "digital_live",     limit: 1,  default: 0
    t.integer   "live",             limit: 1,  default: 0
    t.integer   "multi_purpose",    limit: 1,  default: 0
    t.integer   "powered_mixers",   limit: 1,  default: 0
    t.integer   "recording",        limit: 1,  default: 0
    t.string    "ip_address",       limit: 20
    t.timestamp "datim"
  end

  create_table "_dt_user_product_registration", primary_key: "r_id", force: true do |t|
    t.integer   "u_id",              limit: 8
    t.integer   "p_id"
    t.string    "serial_number",     limit: 100
    t.string    "serial_number2",    limit: 100
    t.string    "serial_number3",    limit: 100
    t.string    "purchased_from",    limit: 100
    t.date      "purchase_date"
    t.date      "registration_date"
    t.string    "ip_address",        limit: 20
    t.timestamp "datim"
  end

  create_table "_dt_users", primary_key: "u_id", force: true do |t|
    t.integer   "contact_form",         limit: 1,   default: 0
    t.integer   "product_registration", limit: 1,   default: 0
    t.integer   "mailing_database",     limit: 1,   default: 0
    t.integer   "brochure_request",     limit: 1,   default: 0
    t.integer   "uid",                  limit: 8
    t.string    "ukey",                 limit: 15
    t.string    "password",             limit: 20
    t.integer   "title"
    t.string    "firstname",            limit: 50
    t.string    "lastname",             limit: 50
    t.string    "company",              limit: 100
    t.string    "address1",             limit: 100
    t.string    "address2",             limit: 100
    t.string    "city",                 limit: 50
    t.string    "state",                limit: 50
    t.string    "zip",                  limit: 20
    t.integer   "country"
    t.string    "email1",               limit: 100
    t.string    "email2",               limit: 100
    t.string    "email3",               limit: 100
    t.string    "email4",               limit: 100
    t.string    "phone",                limit: 50
    t.string    "fax",                  limit: 50
    t.integer   "save_data",            limit: 1,   default: 0
    t.integer   "soundcraft_optin",     limit: 1,   default: 0
    t.integer   "3rdparty_optin",       limit: 1,   default: 0
    t.string    "ip_address",           limit: 20
    t.timestamp "datim"
  end

  add_index "_dt_users", ["email1"], name: "idx_email", using: :btree
  add_index "_dt_users", ["firstname"], name: "idx_firstname", using: :btree
  add_index "_dt_users", ["lastname"], name: "idx_lastname", using: :btree

  create_table "_lu_knowledgebase_categories", primary_key: "cid", force: true do |t|
    t.string "description", limit: 100
  end

  create_table "_lu_knowledgebase_images", primary_key: "iid", force: true do |t|
    t.integer  "kbid"
    t.string   "ref",      limit: 10
    t.string   "filename", limit: 200
    t.datetime "datim"
  end

  create_table "_lu_knowledgebase_products", primary_key: "pid", force: true do |t|
    t.string "description", limit: 100
  end

  create_table "_lu_knowledgebase_types", primary_key: "tid", force: true do |t|
    t.string "description", limit: 100
  end

  create_table "applications", force: true do |t|
    t.integer  "live"
    t.string   "name"
    t.string   "code",               limit: 3
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", force: true do |t|
    t.string   "name"
    t.integer  "default_website_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "brands", ["name"], name: "index_brands_on_name", unique: true, using: :btree

  create_table "countries", force: true do |t|
    t.string   "name",       limit: 100
    t.integer  "live"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "countries", ["id"], name: "country_id", unique: true, using: :btree

  create_table "download_categories", force: true do |t|
    t.integer  "public"
    t.integer  "live"
    t.string   "name",               limit: 50
    t.string   "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "download_sub_categories", force: true do |t|
    t.integer  "download_category_id"
    t.integer  "live"
    t.string   "name",                 limit: 100
    t.string   "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "downloads", force: true do |t|
    t.integer  "download_category_id"
    t.integer  "download_sub_category_id"
    t.integer  "live"
    t.string   "title"
    t.string   "keywords"
    t.string   "slug"
    t.string   "download_file_name"
    t.string   "download_content_type"
    t.integer  "download_file_size"
    t.datetime "download_updated_at"
    t.string   "author",                   limit: 100
    t.integer  "position"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at"
  end

  add_index "downloads", ["id"], name: "product_attachment_id", unique: true, using: :btree

  create_table "enquiries", force: true do |t|
    t.integer  "live"
    t.string   "name"
    t.string   "description"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "file_types", force: true do |t|
    t.string   "name",       limit: 10
    t.string   "file_type",  limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "file_types", ["file_type"], name: "idx_filetype", unique: true, using: :btree

  create_table "menu_pages", force: true do |t|
    t.string   "menu",       limit: 50
    t.integer  "page_id"
    t.integer  "live",                  default: 1
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: true do |t|
    t.integer  "news_category_id"
    t.integer  "country_id"
    t.string   "location"
    t.date     "post_on"
    t.string   "name"
    t.text     "description"
    t.string   "keywords"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "slug"
    t.integer  "live"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_categories", force: true do |t|
    t.string   "name",               limit: 50
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "live"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.integer  "website_id"
    t.string   "title"
    t.string   "description"
    t.string   "keywords"
    t.string   "link_or_html", limit: 50
    t.text     "html"
    t.string   "web_url"
    t.string   "lcl_folder"
    t.string   "lcl_page"
    t.string   "lcl_name",     limit: 100
    t.integer  "live"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["website_id"], name: "index_pages_on_brand_id", using: :btree

  create_table "product_categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "live"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_sub_categories", force: true do |t|
    t.integer  "product_category_id"
    t.string   "name"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "live"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "product_category_id"
    t.integer  "product_sub_category_id"
    t.integer  "live"
    t.string   "name"
    t.string   "headline"
    t.text     "short_description"
    t.text     "description"
    t.string   "keywords"
    t.string   "slug"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image2_file_name"
    t.string   "image2_content_type"
    t.integer  "image2_file_size"
    t.datetime "image2_updated_at"
    t.string   "image3_file_name"
    t.string   "image3_content_type"
    t.integer  "image3_file_size"
    t.datetime "image3_updated_at"
    t.integer  "hidden"
    t.integer  "registration_allowed"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products_applications", id: false, force: true do |t|
    t.integer  "id"
    t.integer  "product_id"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products_downloads", force: true do |t|
    t.integer  "product_id"
    t.integer  "download_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products_images", force: true do |t|
    t.integer  "live"
    t.integer  "product_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products_news", force: true do |t|
    t.integer  "product_id"
    t.integer  "news_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products_sections", force: true do |t|
    t.integer  "live"
    t.integer  "product_id"
    t.integer  "section_id"
    t.text     "section_html"
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products_videos", id: false, force: true do |t|
    t.integer  "id"
    t.integer  "product_id"
    t.integer  "video_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", force: true do |t|
    t.string   "request"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salutations", force: true do |t|
    t.string   "en"
    t.integer  "live"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sda_user_categories", force: true do |t|
    t.integer  "live",                   default: 1
    t.string   "name",        limit: 50
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sda_users", force: true do |t|
    t.integer  "live",                   default: 1
    t.integer  "studer"
    t.integer  "soundcraft"
    t.integer  "sda_user_category_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "sda_users", ["email"], name: "index_sda_users_on_email", unique: true, using: :btree
  add_index "sda_users", ["reset_password_token"], name: "index_sda_users_on_reset_password_token", unique: true, using: :btree

  create_table "sda_users_copy", force: true do |t|
    t.integer  "live",                 default: 1
    t.integer  "studer"
    t.integer  "soundcraft"
    t.integer  "sda_user_category_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.string   "company"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.integer  "live"
    t.string   "title"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "value"
    t.integer  "website_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["website_id", "name"], name: "index_settings_on_brand_id_and_name", using: :btree
  add_index "settings", ["website_id", "name"], name: "index_settings_on_brand_id_and_name_and_locale", using: :btree
  add_index "settings", ["website_id"], name: "index_settings_on_brand_id", using: :btree

  create_table "users", force: true do |t|
    t.integer  "live",                          default: 1
    t.integer  "salutation_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "email2"
    t.string   "job_title"
    t.string   "company"
    t.string   "address1",          limit: 100
    t.string   "address2",          limit: 100
    t.string   "city",              limit: 100
    t.string   "county",            limit: 100
    t.string   "post_code",         limit: 50
    t.integer  "country_id"
    t.string   "phone"
    t.string   "phone2"
    t.integer  "soundcraft_optin"
    t.integer  "third_party_optin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_enquiries", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "enquiry_id"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_products", primary_key: "int", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.string   "serial"
    t.datetime "purchased_date"
    t.string   "purchased_from"
    t.string   "purchased_amount"
    t.text     "comment"
    t.integer  "application_id"
    t.string   "influence"
    t.string   "hear_from"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_requests", primary_key: "int", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "request_id"
    t.string   "subject"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "video_categories", force: true do |t|
    t.integer  "live"
    t.string   "name",               limit: 100
    t.integer  "mwp"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "postion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "video_sub_categories", force: true do |t|
    t.integer  "live"
    t.string   "name",               limit: 100
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "position",                       default: 99
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.integer  "video_category_id"
    t.integer  "video_sub_category_id"
    t.integer  "live"
    t.string   "youtube_code"
    t.string   "title"
    t.string   "description"
    t.string   "keywords"
    t.string   "slug"
    t.string   "image_file_name"
    t.integer  "image_file_size"
    t.string   "image_content_type",    limit: 50
    t.datetime "image_updated_at"
    t.string   "duration"
    t.integer  "mwp"
    t.integer  "featured"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "website_locales", force: true do |t|
    t.integer  "website_id"
    t.string   "locale"
    t.string   "name"
    t.boolean  "default",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "website_locales", ["locale", "website_id"], name: "index_website_locales_on_locale_and_website_id", using: :btree

  create_table "websites", force: true do |t|
    t.integer  "brand_id"
    t.string   "url"
    t.string   "folder"
    t.string   "default_locale"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "websites", ["brand_id"], name: "index_websites_on_brand_id", using: :btree
  add_index "websites", ["url"], name: "index_websites_on_url", unique: true, using: :btree

end
