task :pull_tweets => :environment do
  twitter = TwitterService.new

  hashtags = ["#feelthebern", "#makeamericagreatagain"]

  hashtags.each_with_index do |hashtag, index|
    twitter.search_tweets(hashtag, index)
  end
  puts "created tweets"

end
