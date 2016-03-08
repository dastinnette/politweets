require 'rails_helper'

RSpec.describe Hashtag, type: :model do

  describe "Hashtag model testing" do

    it "is invalid without a name" do
      hashtag = Hashtag.new
      expect(hashtag).to be_invalid
    end
  end

end
