task :clean_tweets => :environment do
  Tweet.assign_states_to_tweets
  puts "states assigned"

end
