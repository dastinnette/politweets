task :pull_tweets => :environment do

  twitter = TwitterService.new
  hashtags = ["#bernie2016", "#trump2016"]

  twitter.search_bernie_tweets(hashtags[0])
  twitter.search_trump_tweets(hashtags[1])
  puts "created tweets"

end
