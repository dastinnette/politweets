require 'rails_helper'

RSpec.describe State, type: :model do

  describe "State model testing" do

    it "is invalid without a name" do
      state = State.new(description: "Boomshakalaka")

      expect(state).to be_invalid
    end

    it "is invalid without a description" do
      state = State.new(name: "ROLL TIDE")

      expect(state).to be_invalid
    end

  end
end
