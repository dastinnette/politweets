task :clean_tweets => :environment do
  Tweet.assign_state_code_to_tweet
  puts "state codes assigned"

  Tweet.assign_state_id_to_tweet
  puts "state ids assigned"
end
