FactoryGirl.define do
  factory :state do
    name "MyString"
  end
  factory :hashtag do
    name "MyString"
  end
  factory :tweet do
    tweet_id "MyString"
    location "MyString"
  end
  factory :user do
    name "MyString"
    screen_name "MyString"
    uid "MyString"
    oauth_token "MyString"
    oauth_token_secret "MyString"
  end
end