task :pull_tweets => :environment do
  twitter = TwitterService.new
  hashtags = ["#feelthebern", "#makeamericagreatagain"]

  twitter.search_bernie_tweets(hashtags[0])
  twitter.search_trump_tweets(hashtags[1])
  binding.pry
  puts "created tweets"

end
