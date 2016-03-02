ActiveRecord::Schema.define(version: 20160302212024) do

  enable_extension "plpgsql"

  create_table "tweets", force: :cascade do |t|
    t.string   "tweet_id"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "screen_name"
    t.string   "uid"
    t.string   "oauth_token"
    t.string   "oauth_token_secret"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
