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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121101211218) do

  create_table "astrochimp_signups", :force => true do |t|
    t.string   "email"
    t.integer  "status"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "referral_id"
    t.string   "referral_code"
    t.integer  "referral_count", :default => 0
  end

  add_index "astrochimp_signups", ["referral_code"], :name => "index_astrochimp_signups_on_referral_code"
  add_index "astrochimp_signups", ["referral_id"], :name => "index_astrochimp_signups_on_referral_id"

end
