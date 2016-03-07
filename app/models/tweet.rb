class Tweet < ActiveRecord::Base
  belongs_to :hashtag
  validates :tweet_id, uniqueness: true
  validates :location, presence: true
  validates :hashtag_id, presence: true
  validates :handle, presence: true
  validates :message, presence: true

  def self.create_from_search(tweet, index)
    t = Tweet.find_or_create_by(tweet_id: tweet.id)

    t.hashtag_id = (index + 1)
    t.location   = tweet.user.location
    t.handle     = tweet.user.screen_name
    t.message    = tweet.text
    t.save
  end

  def self.assign_states_to_tweets
    tweets = Tweet.where(state: nil)
    tweets.each do |tweet|
      state = standardize_location(tweet)
      if state == nil
        tweet.destroy
      else
        tweet.update(state: state)
      end
    end
  end

  def self.standardize_location(tweet)
    location = tweet.location
    state = Geocoder.search(location).try(:first).try(:state)
    state_codes.include?(state) ? state : nil
  end

  def self.count_tweets
    # Rails.cache.fetch("") do
      state_tweets = Tweet.all.group_by(&:state)
      count = state_tweets.each do | key, value|
        state_tweets[key] = value.group_by(&:hashtag_id)
      end
      count
    # end
  end

  def self.bernie_by_state(state)
    if count_tweets[state][1].nil?
      0
    else
      count_tweets[state][1].count
    end
  end

  def self.trump_by_state(state)
    if count_tweets[state][2].nil?
      0
    else
      count_tweets[state][2].count
    end
  end

  def self.winning_margin(state)
    bernie = bernie_by_state(state)
    trump  = trump_by_state(state)
    if bernie < trump
      margin = trump/(bernie + trump).to_f * 100.0
      "Trump - #{margin.round(1)}%"
    else
      margin = bernie/(bernie + trump).to_f * 100.0
      "Bernie - #{margin.round(1)}%"
    end
  end

  def self.state_codes
    ["AL",
     "AK",
     "AZ",
     "AR",
     "CA",
     "CO",
     "CT",
     "DC",
     "DE",
     "FL",
     "GA",
     "HI",
     "ID",
     "IL",
     "IN",
     "IA",
     "KS",
     "KY",
     "LA",
     "ME",
     "MD",
     "MA",
     "MI",
     "MN",
     "MS",
     "MO",
     "MT",
     "NE",
     "NV",
     "NH",
     "NJ",
     "NM",
     "NY",
     "NC",
     "ND",
     "OH",
     "OK",
     "OR",
     "PA",
     "RI",
     "SC",
     "SD",
     "TN",
     "TX",
     "UT",
     "VT",
     "VA",
     "WA",
     "WI",
     "WV",
     "WY"]
  end

  def self.state_names
    ["Alabama",
    "Alaska",
    "Arizona",
    "Arkansas",
    "California",
    "Colorado",
    "Connecticut",
    "District of Columbia",
    "Delaware",
    "Florida",
    "Georgia",
    "Hawaii",
    "Idaho",
    "Illinois",
    "Indiana",
    "Iowa",
    "Kansas",
    "Kentucky",
    "Louisiana",
    "Maine",
    "Maryland",
    "Massachusetts",
    "Michigan",
    "Minnesota",
    "Mississippi",
    "Missouri",
    "Montana",
    "Nebraska",
    "Nevada",
    "New Hampshire",
    "New Jersey",
    "New Mexico",
    "New York",
    "North Carolina",
    "North Dakota",
    "Ohio",
    "Oklahoma",
    "Oregon",
    "Pennsylvania",
    "Rhode Island",
    "South Carolina",
    "South Dakota",
    "Tennessee",
    "Texas",
    "Utah",
    "Vermont",
    "Virginia",
    "Washington",
    "West Virginia",
    "Wisconsin",
    "Wyoming"]
  end

  def self.state_descriptions
    ["We may be 49th in everything, but thank God for Mississippi",
     "No, we can't actually see Russia from our backyards",
     "Beige in every way imaginable",
     "Meth, ag, and horse races",
     "Leading the nation in selfie sticks, second marriages, and segways",
     "Where natives are way too quick and proud call themselves natives - like it's an accomplishment",
     "Close to Boston and NYC...but we never leave home",
     "We're just waiting to ignore you once it's revealed you're not connected to anyone powerful",
     "It's fine",
     "Tourists, old people, red necks, and humidity (and the further you go north, the more south you are)",
     "We'll passive aggressively say 'Bless your heart' and 'Oh, honey' instead of telling someone they're acting like a dumbass",
     "You're not welcome, but we'll take your money",
     "Idaho? Do you mean Iowa?",
     "Chicago and some other stuff",
     "Drive through us to get somewhere better",
     "Iowa exists",
     "Welcome to purgatory",
     "With horses, bourbon, and state parks, we're not as bad as you've heard",
     "New Orleans is fun, Cajun country is charming, and we're sorry about the rest",
     "Half yuppie, half hillbilly, half Stephen King",
     "CRABCAKES AND FOOTBALL",
     "Two seasons: Winter and Construction",
     "Tim Allen has the voice of an angel",
     "Land of 1,000 lakes - and 1,000,000,000 mosquitos",
     "Setting the bar low - you're welcome Alabama",
     "Leading the nation in overrated Italian food and self-righteous sports fans",
     "Voted most likely place to die in a freak bear accident",
     "Corn and football - all we have, all we need",
     "Legal gambling, legal prostitution, 24/7 liquor stores",
     "Everyone here tries to win at being quaint",
     "We gave you Snooki, but hey Sopranos was good",
     "We're poor and we consider 'pain' a flavor",
     "We talk tough to make up for our admittedly subpar pizza",
     "We're slowly joining civilization",
     "West Minnesota - protecting South Dakota from Canada",
     "We're stuck here...where it's acceptable to wear pajamas in public all the time",
     "We're all armchair meteorologists here",
     "We're good at recycling",
     "Two cities that hate each other divided by the Amish",
     "The poor man's Massachusetts",
     "Land of sweet tea, rednecks, and 'Hey! We seceded from the Union first!'",
     "We aren't the best, but at least we're not North Dakota",
     "We'd wear cowboy boots to the pool if we thought we could get away with it",
     "Big hair, big football stadiums, and big superiority complexes",
     "Mormons and snowboarding",
     "A mountainous region of small villages in which hippies and rednecks coexist more or less peacefully",
     "House of Cards in the east, Deliverance in the west",
     "Trees, weed, rain, and coffee",
     "All we need is a banjo and a jug of moonshine",
     "It's too cold to be sober",
     "Five times more cows than people live here - let that sink in"]
  end

end
