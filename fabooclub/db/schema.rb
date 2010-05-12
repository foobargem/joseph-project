# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100512024950) do

  create_table "feeds", :force => true do |t|
    t.string   "fb_id"
    t.string   "from_id"
    t.string   "from_name"
    t.string   "from_category"
    t.string   "to_id"
    t.string   "to_name"
    t.string   "to_category"
    t.text     "message"
    t.string   "picture"
    t.string   "link"
    t.string   "name"
    t.string   "icon"
    t.string   "caption"
    t.integer  "likes"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "orig_picture"
    t.integer  "orig_picture_width",  :default => 0
    t.integer  "orig_picture_height", :default => 0
  end

  create_table "page_metadatas", :force => true do |t|
    t.string   "fb_id"
    t.string   "name"
    t.string   "picture"
    t.string   "link"
    t.string   "category"
    t.string   "founded"
    t.text     "company_overview"
    t.text     "mission"
    t.integer  "fan_count",        :default => 0
    t.string   "feed_url"
    t.string   "posts_url"
    t.string   "tagged_url"
    t.string   "statuses_url"
    t.string   "links_url"
    t.string   "notes_url"
    t.string   "photos_url"
    t.string   "albums_url"
    t.string   "events_url"
    t.string   "videos_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
