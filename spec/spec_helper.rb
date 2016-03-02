require "simplecov"
SimpleCov.start("rails")

  def user
    User.create(uid: ENV['TWITTER_UID'],
                name: 'David Stinnette',
                screen_name: 'dastinnette',
                oauth_token: ENV['TWITTER_TOKEN'],
                oauth_token_secret: ENV['TWITTER_TOKEN_SECRET'])
  end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
