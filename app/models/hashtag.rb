class Hashtag < ActiveRecord::Base
  has_many :tweets
end
