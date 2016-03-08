require 'rails_helper'

RSpec.describe User, type: :model do

  describe "User model testing" do

    it "is invalid without a name" do
      user = User.new(uid: 22,
                      name: "Bernard")
      expect(user).to be_invalid
    end

    it "is invalid without a screen_name" do
      user = User.new(uid: 22,
                      screen_name: "bernie4prez")
      expect(user).to be_invalid
    end
  end

end
