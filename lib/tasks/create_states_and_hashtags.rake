require 'csv'

task :state_and_hashtags => :environment do

  CSV.readlines('data/states.csv', headers: true, header_converters: :symbol).each do |row|
    State.create!(row.to_h)
  end
  puts "created states"

  CSV.readlines('data/hashtags.csv', headers: true, header_converters: :symbol).each do |row|
    Hashtag.create!(row.to_h)
  end
  puts "created hashtags"

end
