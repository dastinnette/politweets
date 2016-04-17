task :clean_tweets => :environment do
  TweetFormatter.assign_state_code_to_tweet
  puts "state codes assigned"

  TweetFormatter.assign_state_id_to_tweet
  puts "state ids assigned"
end
