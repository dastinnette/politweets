require 'rails_helper'

RSpec.describe StatesController, type: :controller do

  describe "GET index" do
    it "assigns @states" do
      state = State.create(name: "Indiana", description: "Corn")
      get :index

      expect(assigns(:states)).to eq([state])
    end

    it "renders index template" do
      get :index

      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "renders show template" do
      state = State.create(name: "Indiana", description: "Corn")
      get :show, id: state.id

      expect(response).to render_template("show")
    end
  end

end
